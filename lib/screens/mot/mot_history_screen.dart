import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/providers/mot_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/services/dvla_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';
import 'package:my_vehicles/widgets/staggered_list_item.dart';

class MOTHistoryScreen extends ConsumerStatefulWidget {
  const MOTHistoryScreen({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  ConsumerState<MOTHistoryScreen> createState() => _MOTHistoryScreenState();
}

class _MOTHistoryScreenState extends ConsumerState<MOTHistoryScreen> {
  bool _isCheckingDvla = false;

  Future<void> _checkWithDvla() async {
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    setState(() => _isCheckingDvla = true);
    try {
      final data =
          await DvlaService.lookupRegistration(vehicle.registration);
      if (data == null || !mounted) return;

      final updated = vehicle.copyWith(
        motDueDate: (data['motExpiryDate'] as String?) ?? vehicle.motDueDate,
        motStatus: (data['motStatus'] as String?) ?? vehicle.motStatus,
      );
      await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    } catch (_) {
      // Silent failure
    } finally {
      if (mounted) setState(() => _isCheckingDvla = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final recordsAsync = ref.watch(motRecordsProvider(widget.vehicleId));
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final vehicleName = vehiclesAsync.valueOrNull
        ?.where((v) => v.id == widget.vehicleId)
        .firstOrNull;

    final vehicleLabel = vehicleName != null
        ? [
            if (vehicleName.registration.isNotEmpty)
              vehicleName.registration.toUpperCase(),
            vehicleName.shortDescription,
          ].join('  ')
        : '';

    // Show "Check with DVLA" when vehicle is DVLA-verified and MOT is expired or due within 30 days
    final showDvlaCheck = vehicleName != null &&
        vehicleName.dvlaVerified &&
        DvlaService.isAvailable &&
        vehicleName.motDueDate.isNotEmpty &&
        (isPastDate(vehicleName.motDueDate) ||
            isDueSoon(vehicleName.motDueDate));

    return AppScaffold(
      title: 'MOT History',
      useOverlayNav: true,
      showBackButton: true,
      overlayFabIcon: Icons.add_rounded,
      overlayFabOnPressed: () => context.push('/add-mot/${widget.vehicleId}'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (vehicleLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Text(
                'Vehicle:  $vehicleLabel',
                style: AppTextStyles.bodyBold.copyWith(
                  color: AppColors.textPrimary,
                ),
              ),
            ),
          if (vehicleName != null &&
              vehicleName.dvlaVerified &&
              vehicleName.motDueDate.isNotEmpty)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 16, 0),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: () {
                    final days = daysUntil(vehicleName.motDueDate);
                    if (days < 0) return AppColors.softRed;
                    if (days <= 30) return AppColors.softOrange;
                    return AppColors.softGreen;
                  }(),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          () {
                            final days = daysUntil(vehicleName.motDueDate);
                            if (days < 0) return Icons.error_rounded;
                            if (days <= 30) return Icons.warning_amber_rounded;
                            return Icons.check_circle_rounded;
                          }(),
                          color: () {
                            final days = daysUntil(vehicleName.motDueDate);
                            if (days < 0) return AppColors.danger;
                            if (days <= 30) return AppColors.warning;
                            return AppColors.success;
                          }(),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            () {
                              final days = daysUntil(vehicleName.motDueDate);
                              if (days < 0) {
                                return 'MOT expired ${-days} days ago';
                              }
                              return 'MOT due ${formatDateRelative(vehicleName.motDueDate)}';
                            }(),
                            style: AppTextStyles.bodyBold.copyWith(
                              color: () {
                                final days = daysUntil(vehicleName.motDueDate);
                                if (days < 0) return AppColors.danger;
                                if (days <= 30) return AppColors.warning;
                                return AppColors.success;
                              }(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (vehicleName.motStatus.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        'DVLA status: ${vehicleName.motStatus}  ·  Expires ${formatDateUK(vehicleName.motDueDate)}',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ],
                ),
              ),
            ),
          if (showDvlaCheck)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: _isCheckingDvla ? null : _checkWithDvla,
                  icon: _isCheckingDvla
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : const Icon(Icons.verified_rounded, size: 18),
                  label: const Text('Check with DVLA'),
                ),
              ),
            ),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (records) {
                if (records.isEmpty) {
                  return const EmptyState(
                    message: 'No MOT records',
                    subtitle: 'Tap + to add your first MOT record',
                    imagePath: 'assets/images/mot-button.png',
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.all(16),
            itemCount: records.length,
            itemBuilder: (context, index) {
              final record = records[index];
              final passed = record.result == 'pass';

              return StaggeredListItem(
                index: index,
                child: Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () => context.push(
                      '/edit-mot/${widget.vehicleId}/${record.id}'),
                  borderRadius: BorderRadius.circular(16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Line 1: reg make model ... PASS/FAIL
                        Row(
                          children: [
                            if (vehicleName != null)
                              Expanded(
                                child: Text(
                                  '${vehicleName.registration.toUpperCase()}  ${vehicleName.make} ${vehicleName.model}',
                                  style: AppTextStyles.bodyBold,
                                ),
                              ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 3),
                              decoration: BoxDecoration(
                                color: passed
                                    ? AppColors.softGreen
                                    : AppColors.softRed,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Text(
                                passed ? 'PASS' : 'FAIL',
                                style: TextStyle(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 13,
                                  color: passed
                                      ? AppColors.success
                                      : AppColors.danger,
                                ),
                              ),
                            ),
                          ],
                        ),
                        // Line 2: Valid date to date
                        const SizedBox(height: 4),
                        if (record.testDate.isNotEmpty &&
                            record.expiryDate.isNotEmpty)
                          Text(
                            'Valid ${formatDateUK(record.testDate)} to ${formatDateUK(record.expiryDate)}',
                            style: AppTextStyles.caption,
                          )
                        else if (record.testDate.isNotEmpty)
                          Text(
                            formatDateUK(record.testDate),
                            style: AppTextStyles.caption,
                          ),
                        // Line 3: test centre ... mileage
                        if (record.testCentre.isNotEmpty ||
                            record.mileage > 0) ...[
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              if (record.testCentre.isNotEmpty)
                                Expanded(
                                  child: Text(
                                    record.testCentre,
                                    style: AppTextStyles.caption,
                                  ),
                                )
                              else
                                const Spacer(),
                              if (record.mileage > 0)
                                Text(
                                  '${record.mileage} mi',
                                  style: AppTextStyles.caption,
                                ),
                            ],
                          ),
                        ],
                        // Advisories
                        if (record.advisories.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppColors.softOrange,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Advisories',
                                  style: AppTextStyles.caption.copyWith(
                                      color: AppColors.warning),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  record.advisories,
                                  style: AppTextStyles.body
                                      .copyWith(fontSize: 13),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
                ),
              );
            },
          );
              },
            ),
          ),
        ],
      ),
    );
  }
}
