import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/staggered_list_item.dart';

class VehicleDetailScreen extends ConsumerWidget {
  const VehicleDetailScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);

    return vehiclesAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicles) {
        final vehicle = vehicles.where((v) => v.id == vehicleId).firstOrNull;
        if (vehicle == null) {
          return AppScaffold(
            title: '',
            showBackButton: true,
            body: const Center(child: Text('Vehicle not found')),
          );
        }

        return AppScaffold(
          useOverlayNav: true,
          title: 'Vehicle Details',
          showBackButton: true,
          showHomeButton: false,
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Photo + info card — Hero target for list → detail transition
                Hero(
                  tag: 'vehicle-$vehicleId',
                  child: Material(
                    type: MaterialType.transparency,
                    clipBehavior: Clip.hardEdge,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (vehicle.photoPath.isNotEmpty &&
                            DocumentService.fileExistsSync(vehicle.photoPath))
                          Container(
                            height: 200,
                            width: double.infinity,
                            margin: const EdgeInsets.only(bottom: 16),
                            clipBehavior: Clip.antiAlias,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Image.file(
                              File(DocumentService.resolvePathSync(vehicle.photoPath)),
                              fit: BoxFit.cover,
                            ),
                          ),
                        Card(
                          child: InkWell(
                            onTap: () => context.push('/vehicle-info/${vehicle.id}'),
                            borderRadius: BorderRadius.circular(16),
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: _colourFromName(vehicle.colour).withValues(alpha: 0.15),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(Icons.directions_car_rounded,
                                        color: _colourFromName(vehicle.colour), size: 26),
                                  ),
                                  const SizedBox(width: 12),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          [
                                            vehicle.make,
                                            vehicle.model,
                                            vehicle.year,
                                          ].where((s) => s.isNotEmpty).join(' \u2022 '),
                                          style: AppTextStyles.subheading,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if (vehicle.registration.isNotEmpty) ...[
                                          const SizedBox(height: 2),
                                          Text(
                                            vehicle.registration.toUpperCase(),
                                            style: AppTextStyles.caption,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                  const Icon(Icons.chevron_right_rounded,
                                      color: AppColors.textMuted),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Icon panels grid
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 12,
                  childAspectRatio: 0.85,
                  children: [
                    StaggeredListItem(
                      index: 0,
                      child: _IconPanel(
                        icon: Icons.build_rounded,
                        label: 'Service',
                        color: AppColors.primary,
                        onTap: () => context
                            .push('/service-history/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 1,
                      child: _IconPanel(
                        icon: Icons.verified_rounded,
                        label: 'MOT',
                        subtitle: _motSubtitle(vehicle),
                        subtitleColor: _motColor(vehicle),
                        color: const Color(0xFF2E7D32),
                        onTap: () =>
                            context.push('/mot-history/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 2,
                      child: _IconPanel(
                        icon: Icons.shield_rounded,
                        label: 'Insurance',
                        subtitle: _insuranceSubtitle(vehicle),
                        subtitleColor: _insuranceColor(vehicle),
                        color: const Color(0xFF1565C0),
                        onTap: () => context
                            .push('/insurance-info/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 3,
                      child: _IconPanel(
                        icon: Icons.receipt_long_rounded,
                        label: 'Car Tax',
                        subtitle: (vehicle.ownership == 'leased' ||
                                vehicle.ownership == 'pch')
                            ? 'N/A (Leased)'
                            : _taxSubtitle(vehicle),
                        subtitleColor: (vehicle.ownership == 'leased' ||
                                vehicle.ownership == 'pch')
                            ? AppColors.textMuted
                            : _taxColor(vehicle),
                        color: const Color(0xFF00695C),
                        onTap: () => context
                            .push('/car-tax-info/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 4,
                      child: _IconPanel(
                        icon: Icons.car_repair_rounded,
                        label: 'Breakdown',
                        color: const Color(0xFFFF9800),
                        onTap: () => context
                            .push('/breakdown-info/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 5,
                      child: _IconPanel(
                        icon: Icons.local_shipping_rounded,
                        label: 'Accident',
                        color: const Color(0xFFE53935),
                        onTap: () => context
                            .push('/recovery-info/${vehicle.id}'),
                      ),
                    ),
                    StaggeredListItem(
                      index: 6,
                      child: _IconPanel(
                        icon: Icons.account_balance_rounded,
                        label: 'Ownership',
                        color: const Color(0xFF6A1B9A),
                        onTap: () => context
                            .push('/ownership-info/${vehicle.id}'),
                      ),
                    ),
                  ],
                ),

                // Delete button
                const SizedBox(height: 32),
                Center(
                  child: TextButton.icon(
                    onPressed: () => _confirmDelete(context, ref),
                    icon: const Icon(Icons.delete_outline_rounded,
                        color: AppColors.danger),
                    label: const Text('Delete Vehicle',
                        style: TextStyle(color: AppColors.danger)),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  bool _isUnder3Years(String yearStr) {
    if (yearStr.isEmpty) return false;
    final year = int.tryParse(yearStr);
    if (year == null) return false;
    return (DateTime.now().year - year) < 3;
  }

  String _motSubtitle(Vehicle vehicle) {
    if (_isUnder3Years(vehicle.year)) return 'Not Required';
    return _dateSubtitle(vehicle.motDueDate);
  }

  Color _motColor(Vehicle vehicle) {
    if (_isUnder3Years(vehicle.year)) return AppColors.textMuted;
    return _dateColor(vehicle.motDueDate);
  }

  String _insuranceSubtitle(Vehicle vehicle) {
    if (vehicle.insuranceRenewalDate.isNotEmpty) {
      return formatDateRelative(vehicle.insuranceRenewalDate);
    }
    if (vehicle.insurer.isNotEmpty) return vehicle.insurer;
    return 'Not set';
  }

  Color _insuranceColor(Vehicle vehicle) {
    if (vehicle.insuranceRenewalDate.isNotEmpty) {
      return _dateColor(vehicle.insuranceRenewalDate);
    }
    if (vehicle.insurer.isNotEmpty) return AppColors.success;
    return AppColors.textMuted;
  }

  String _dateSubtitle(String dateStr) {
    if (dateStr.isEmpty) return 'Not set';
    return formatDateRelative(dateStr);
  }

  // Tax respects the DVLA "Taxed" status: a confirmed-taxed vehicle is never
  // shown as expired, even if the stored due date has passed.
  String _taxSubtitle(Vehicle vehicle) {
    if (isTaxConfirmed(vehicle.taxStatus)) return 'Taxed';
    return _dateSubtitle(vehicle.taxDueDate);
  }

  Color _taxColor(Vehicle vehicle) {
    if (isTaxConfirmed(vehicle.taxStatus)) return AppColors.success;
    return _dateColor(vehicle.taxDueDate);
  }

  Color _dateColor(String dateStr) {
    if (dateStr.isEmpty) return AppColors.textMuted;
    final days = daysUntil(dateStr);
    if (days < 0) return AppColors.danger;
    if (days <= 7) return AppColors.danger;
    if (days <= 30) return AppColors.warning;
    return AppColors.success;
  }

  Color _colourFromName(String name) {
    return switch (name.toLowerCase().trim()) {
      'black' => const Color(0xFF212121),
      'white' => const Color(0xFF9E9E9E), // darken so icon is visible
      'silver' || 'grey' || 'gray' => const Color(0xFF757575),
      'red' => const Color(0xFFC62828),
      'blue' => const Color(0xFF1565C0),
      'green' => const Color(0xFF2E7D32),
      'yellow' => const Color(0xFFF9A825),
      'orange' => const Color(0xFFEF6C00),
      'brown' => const Color(0xFF5D4037),
      'gold' => const Color(0xFFFF8F00),
      'beige' || 'cream' => const Color(0xFFBCAAA4),
      'purple' => const Color(0xFF7B1FA2),
      _ => AppColors.primary,
    };
  }

  void _confirmDelete(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Vehicle?'),
        content: const Text(
            'This will permanently delete this vehicle and all its service history, MOT records and documents.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref.read(vehiclesProvider.notifier).deleteVehicle(vehicleId);
              Navigator.pop(ctx);
              context.go('/');
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.danger)),
          ),
        ],
      ),
    );
  }
}

class _IconPanel extends StatelessWidget {
  const _IconPanel({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
    this.subtitle,
    this.subtitleColor,
  });

  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;
  final String? subtitle;
  final Color? subtitleColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                color.withValues(alpha: 0.06),
              ],
            ),
          ),
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.withValues(alpha: 0.15),
                      color.withValues(alpha: 0.08),
                    ],
                  ),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, color: color, size: 24),
              ),
              const SizedBox(height: 6),
              Text(label,
                  style: AppTextStyles.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      color: AppColors.textPrimary)),
              if (subtitle != null) ...[
                const SizedBox(height: 2),
                Text(
                  subtitle!,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w600,
                    color: subtitleColor ?? AppColors.textMuted,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
