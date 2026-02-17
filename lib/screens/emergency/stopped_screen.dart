import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_gradients.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/widgets/date_status_badge.dart';

class StoppedScreen extends ConsumerWidget {
  const StoppedScreen({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final profileAsync = ref.watch(profileProvider);

    return vehiclesAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicles) {
        final vehicle = vehicles
            .where((v) => v.id == vehicleId)
            .firstOrNull;
        if (vehicle == null) {
          return const Scaffold(
              body: Center(child: Text('Vehicle not found')));
        }
        final profile = profileAsync.valueOrNull;

        return Scaffold(
          body: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: AppGradients.emergencyStopped,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_rounded,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        Expanded(
                          child: Text(
                            "I've Been Stopped",
                            style: AppTextStyles.heading
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        const Icon(Icons.local_police_rounded,
                            color: Colors.white, size: 36),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Tips
                      Card(
                        color: AppColors.softPurple,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.info_outline_rounded,
                                      color: AppColors.primary),
                                  const SizedBox(width: 8),
                                  Text('Stay calm',
                                      style: AppTextStyles.bodyBold
                                          .copyWith(
                                              color: AppColors.primary)),
                                ],
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'You are required to provide your name, address, and show your driving licence, insurance, and MOT certificate if asked.',
                                style: AppTextStyles.body,
                              ),
                            ],
                          ),
                        ),
                      ),

                      // Licence details
                      if (profile != null) ...[
                        const SizedBox(height: 24),
                        Text('Driving Licence',
                            style: AppTextStyles.subheading),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                _DetailRow('Name', profile.name),
                                _DetailRow('Licence No.',
                                    profile.licenceNumber),
                                _DetailRow('Categories',
                                    profile.licenceCategories),
                                _DetailRow('Address', profile.address),
                                if (profile.licenceExpiry.isNotEmpty)
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 100,
                                            child: Text('Expiry')),
                                        DateStatusBadge(
                                          label: '',
                                          dateStr: profile.licenceExpiry,
                                          compact: true,
                                        ),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ],

                      // Insurance
                      const SizedBox(height: 24),
                      Text('Insurance', style: AppTextStyles.subheading),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _DetailRow('Insurer', vehicle.insurer),
                              _DetailRow('Policy No.',
                                  vehicle.insurancePolicyNumber),
                              _DetailRow('Type', vehicle.insuranceType),
                              _DetailRow(
                                  'Insured Drivers',
                                  vehicle.insuredDrivers),
                              if (vehicle
                                  .insuranceRenewalDate.isNotEmpty) ...[
                                const SizedBox(height: 8),
                                DateStatusBadge(
                                  label: 'Renewal',
                                  dateStr: vehicle.insuranceRenewalDate,
                                  compact: true,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),

                      // MOT & Tax
                      const SizedBox(height: 24),
                      Text('MOT & Tax', style: AppTextStyles.subheading),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: DateStatusBadge(
                              label: 'MOT Due',
                              dateStr: vehicle.motDueDate,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: DateStatusBadge(
                              label: 'Tax Due',
                              dateStr: vehicle.taxDueDate,
                            ),
                          ),
                        ],
                      ),

                      // Vehicle details
                      const SizedBox(height: 24),
                      Text('Vehicle Details',
                          style: AppTextStyles.subheading),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _DetailRow('Registration',
                                  vehicle.registration.toUpperCase()),
                              _DetailRow('Make', vehicle.make),
                              _DetailRow('Model', vehicle.model),
                              _DetailRow('Year', vehicle.year),
                              _DetailRow('Colour', vehicle.colour),
                              _DetailRow('Fuel Type', vehicle.fuelType),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DetailRow extends StatelessWidget {
  const _DetailRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Expanded(child: Text(value, style: AppTextStyles.bodyBold)),
        ],
      ),
    );
  }
}
