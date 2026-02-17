import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/providers/alerts_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';
import 'package:my_vehicles/widgets/vehicle_card.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final alertsAsync = ref.watch(alertsProvider);

    return AppScaffold(
      title: 'My Vehicles',
      isHome: true,
      centerTitle: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push('/add-vehicle'),
        child: const Icon(Icons.add_rounded),
      ),
      body: vehiclesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (vehicles) {
          if (vehicles.isEmpty) {
            return EmptyState(
              message: 'Welcome to MyVehicles',
              subtitle: 'Add your first vehicle to get started',
              actionLabel: 'Add Vehicle',
              onAction: () => context.push('/add-vehicle'),
              imagePath: 'assets/images/rescue-character.png',
            );
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Alert banner
              alertsAsync.whenData((alerts) {
                final urgent = alerts.where((a) =>
                    a.level == AlertLevel.expired ||
                    a.level == AlertLevel.urgent);
                if (urgent.isEmpty) return const SizedBox.shrink();
                final top = urgent.first;
                return Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: top.level == AlertLevel.expired
                        ? AppColors.softRed
                        : AppColors.softOrange,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: top.level == AlertLevel.expired
                          ? AppColors.danger
                          : AppColors.warning,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        color: top.level == AlertLevel.expired
                            ? AppColors.danger
                            : AppColors.warning,
                        size: 20,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          top.daysRemaining < 0
                              ? '${top.vehicleReg} ${top.label} expired ${-top.daysRemaining} days ago!'
                              : '${top.vehicleReg} ${top.label} due ${formatDateRelative(top.date)}',
                          style: AppTextStyles.bodyBold.copyWith(
                            fontSize: 13,
                            color: top.level == AlertLevel.expired
                                ? AppColors.danger
                                : AppColors.warning,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }).valueOrNull ??
                  const SizedBox.shrink(),

              // One card per vehicle — everything in it
              ...vehicles.map((v) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: VehicleCard(
                      vehicle: v,
                      onTap: () => context.push('/vehicle/${v.id}'),
                    ),
                  )),

              const SizedBox(height: 64),
            ],
          );
        },
      ),
    );
  }
}
