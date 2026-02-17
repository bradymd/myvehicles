import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_gradients.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/phone_helpers.dart';
import 'package:my_vehicles/widgets/phone_button.dart';

class AccidentScreen extends ConsumerWidget {
  const AccidentScreen({super.key, required this.vehicleId});
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
                  gradient: AppGradients.emergencyAccident,
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
                            "I've Had an Accident",
                            style: AppTextStyles.heading
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'assets/images/crash-recovery.png',
                            height: 48,
                          ),
                        ),
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
                      // Emergency call
                      Card(
                        color: AppColors.softRed,
                        child: ListTile(
                          leading: const Icon(Icons.emergency_rounded,
                              color: AppColors.emergencyRed, size: 32),
                          title: Text('Call 999 if anyone is injured',
                              style: AppTextStyles.bodyBold
                                  .copyWith(color: AppColors.danger)),
                          trailing: IconButton(
                            icon: const Icon(Icons.phone_rounded,
                                color: AppColors.emergencyRed, size: 28),
                            onPressed: () => makePhoneCall('999'),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                      ),

                      // Step by step guide
                      const SizedBox(height: 24),
                      Text('What to Do', style: AppTextStyles.subheading),
                      const SizedBox(height: 12),
                      _StepCard(
                          step: 1,
                          title: 'Stop & stay safe',
                          description:
                              'Stop your vehicle. Turn on hazard lights. Check for injuries.'),
                      _StepCard(
                          step: 2,
                          title: 'Call 999 if needed',
                          description:
                              'Call emergency services if anyone is injured or the road is blocked.'),
                      _StepCard(
                          step: 3,
                          title: 'Exchange details',
                          description:
                              'Get name, address, phone, insurance details, registration from other parties.'),
                      _StepCard(
                          step: 4,
                          title: 'Take photos',
                          description:
                              'Photograph damage, the scene, road conditions, and registration plates.'),
                      _StepCard(
                          step: 5,
                          title: 'Note details',
                          description:
                              'Time, date, weather, road conditions, witnesses.'),
                      _StepCard(
                          step: 6,
                          title: 'Call your insurer',
                          description:
                              'Report the accident to your insurance company.'),

                      // Insurance details
                      if (vehicle.insurer.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text('Your Insurance',
                            style: AppTextStyles.subheading),
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
                              ],
                            ),
                          ),
                        ),
                      ],

                      // Vehicle details
                      const SizedBox(height: 24),
                      Text('Your Vehicle', style: AppTextStyles.subheading),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              _DetailRow('Registration',
                                  vehicle.registration.toUpperCase()),
                              _DetailRow('Vehicle',
                                  '${vehicle.make} ${vehicle.model}'),
                              _DetailRow('Colour', vehicle.colour),
                            ],
                          ),
                        ),
                      ),

                      // Driver details
                      if (profile != null) ...[
                        const SizedBox(height: 24),
                        Text('Driver Details',
                            style: AppTextStyles.subheading),
                        const SizedBox(height: 8),
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                _DetailRow('Name', profile.name),
                                _DetailRow(
                                    'Licence', profile.licenceNumber),
                                _DetailRow('Address', profile.address),
                              ],
                            ),
                          ),
                        ),
                      ],

                      // Recovery call
                      if (vehicle.recoveryContact.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        PhoneButton(
                          label: 'Call Recovery',
                          phoneNumber: vehicle.recoveryContact,
                          color: AppColors.emergencyOrange,
                          large: true,
                        ),
                      ],

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

class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.title,
    required this.description,
  });

  final int step;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.emergencyRed,
          radius: 16,
          child: Text(
            '$step',
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        title: Text(title, style: AppTextStyles.bodyBold),
        subtitle: Text(description, style: AppTextStyles.caption),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16)),
      ),
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
