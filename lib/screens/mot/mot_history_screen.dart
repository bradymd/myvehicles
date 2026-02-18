import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/providers/mot_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';

class MOTHistoryScreen extends ConsumerWidget {
  const MOTHistoryScreen({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recordsAsync = ref.watch(motRecordsProvider(vehicleId));
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
      title: 'MOT History',
      useOverlayNav: true,
      showBackButton: true,
      overlayFabIcon: Icons.add_rounded,
      overlayFabOnPressed: () => context.push('/add-mot/$vehicleId'),
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

              return Card(
                margin: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () => context.push(
                      '/edit-mot/$vehicleId/${record.id}'),
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
