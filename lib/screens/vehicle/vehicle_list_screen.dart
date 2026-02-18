import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';
import 'package:my_vehicles/widgets/vehicle_card.dart';

class VehicleListScreen extends ConsumerWidget {
  const VehicleListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);

    return AppScaffold(
      title: '',
      showBackButton: true,
      onBack: () => context.go('/'),
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
              message: 'No vehicles yet',
              subtitle: 'Add your first vehicle to get started',
              actionLabel: 'Add Vehicle',
              onAction: () => context.push('/add-vehicle'),
            );
          }
          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: vehicles.length,
            itemBuilder: (context, index) {
              final v = vehicles[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: VehicleCard(
                  vehicle: v,
                  onTap: () => context.push('/vehicle/${v.id}'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
