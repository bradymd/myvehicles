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
import 'package:my_vehicles/widgets/vehicle_page_header.dart';

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

    return AppScaffold(
      title: 'My Vehicles',
      centerTitle: true,
      showBackButton: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-mot/$vehicleId'),
        child: const Icon(Icons.add_rounded),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (vehicleName != null)
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: VehiclePageHeader(
                pageTitle: 'MOT History',
                registration: vehicleName.registration,
                vehicleDescription: vehicleName.shortDescription,
              ),
            ),
          Expanded(
            child: recordsAsync.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('Error: $e')),
              data: (records) {
                if (records.isEmpty) {
                  return EmptyState(
                    message: 'No MOT records',
                    subtitle: 'Add your first MOT record',
                    actionLabel: 'Add MOT',
                    onAction: () => context.push('/add-mot/$vehicleId'),
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
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
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
                                  color: passed
                                      ? AppColors.success
                                      : AppColors.danger,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Column(
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    formatDateUK(record.testDate),
                                    style: AppTextStyles.bodyBold,
                                  ),
                                  if (record.testCentre.isNotEmpty)
                                    Text(
                                      record.testCentre,
                                      style: AppTextStyles.caption,
                                    ),
                                ],
                              ),
                            ),
                            if (record.mileage > 0)
                              Text(
                                '${record.mileage} mi',
                                style: AppTextStyles.caption,
                              ),
                          ],
                        ),
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
                        if (record.expiryDate.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            'Expires: ${formatDateUK(record.expiryDate)}',
                            style: AppTextStyles.caption,
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
