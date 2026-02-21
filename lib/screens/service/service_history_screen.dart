import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/providers/service_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';
import 'package:my_vehicles/widgets/staggered_list_item.dart';

class ServiceHistoryScreen extends ConsumerWidget {
  const ServiceHistoryScreen({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final entriesAsync = ref.watch(serviceEntriesProvider(vehicleId));
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final vehicleName = vehiclesAsync.valueOrNull
        ?.where((v) => v.id == vehicleId)
        .firstOrNull;

    final vehicleLabel = vehicleName != null
        ? [
            if (vehicleName.registration.isNotEmpty)
              vehicleName.registration.toUpperCase(),
            vehicleName.shortDescription,
          ].join('  ')
        : '';

    return AppScaffold(
      title: 'Service History',
      useOverlayNav: true,
      showBackButton: true,
      overlayFabIcon: Icons.add_rounded,
      overlayFabOnPressed: () => context.push('/add-service/$vehicleId'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: entriesAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (entries) {
                if (entries.isEmpty) {
                  return EmptyState(
                    message: 'No service history',
                    subtitle: 'Add your first service record',
                    actionLabel: 'Add Service',
                    onAction: () => context.push('/add-service/$vehicleId'),
                  );
                }

                final totalCost = entries.fold(0.0, (sum, e) => sum + e.cost);

                return ListView(
                  padding: const EdgeInsets.all(16),
            children: [
              // Vehicle identifier
              if (vehicleLabel.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Text(
                    'Vehicle:  $vehicleLabel',
                    style: AppTextStyles.bodyBold.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                ),
              // Cost summary
              Card(
                color: AppColors.softPurple,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Total Spent', style: AppTextStyles.caption),
                          Text(
                            '\u00A3${totalCost.toStringAsFixed(2)}',
                            style: AppTextStyles.heading
                                .copyWith(color: AppColors.primary),
                          ),
                        ],
                      ),
                      Text(
                        '${entries.length} record${entries.length != 1 ? 's' : ''}',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Entries
              ...entries.asMap().entries.map((e) {
                final entry = e.value;
                final type = ServiceType.values
                    .where((t) => t.name == entry.type)
                    .firstOrNull;
                return StaggeredListItem(
                  index: e.key,
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.softPurple,
                        child: Icon(
                          _iconForType(entry.type),
                          color: AppColors.primary,
                          size: 20,
                        ),
                      ),
                      title: Text(
                        entry.description.isNotEmpty
                            ? entry.description
                            : (type?.label ?? 'Service'),
                        style: AppTextStyles.bodyBold,
                      ),
                      subtitle: Text(
                        '${formatDateUK(entry.date)}${entry.garage.isNotEmpty ? ' \u2022 ${entry.garage}' : ''}',
                        style: AppTextStyles.caption,
                      ),
                      trailing: entry.cost > 0
                          ? Text(
                              '\u00A3${entry.cost.toStringAsFixed(2)}',
                              style: AppTextStyles.bodyBold
                                  .copyWith(color: AppColors.primary),
                            )
                          : null,
                      onTap: () => context.push(
                          '/edit-service/$vehicleId/${entry.id}'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                );
              }),
            ],
          );
              },
            ),
          ),
        ],
      ),
    );
  }

  IconData _iconForType(String type) => switch (type) {
        'service' => Icons.build_rounded,
        'mot' => Icons.verified_rounded,
        'repair' => Icons.handyman_rounded,
        'tyres' => Icons.tire_repair_rounded,
        _ => Icons.miscellaneous_services_rounded,
      };
}
