import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';

class VehicleSelector extends ConsumerWidget {
  const VehicleSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final selectedId = ref.watch(selectedVehicleIdProvider);

    return vehiclesAsync.when(
      loading: () => const SizedBox.shrink(),
      error: (_, _) => const SizedBox.shrink(),
      data: (vehicles) {
        if (vehicles.length <= 1) return const SizedBox.shrink();
        final effectiveId = selectedId ?? vehicles.firstOrNull?.id;

        return SizedBox(
          height: 40,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: vehicles.length,
            separatorBuilder: (_, _) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final v = vehicles[index];
              final isSelected = v.id == effectiveId;
              return ChoiceChip(
                label: Text(
                  v.registration.isNotEmpty
                      ? v.registration.toUpperCase()
                      : v.make,
                ),
                selected: isSelected,
                selectedColor: AppColors.accent,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.white : AppColors.textPrimary,
                  fontWeight: FontWeight.w600,
                ),
                onSelected: (_) => ref
                    .read(selectedVehicleIdProvider.notifier)
                    .state = v.id,
              );
            },
          ),
        );
      },
    );
  }
}
