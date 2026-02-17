import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/services/location_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_gradients.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/phone_helpers.dart';
import 'package:my_vehicles/widgets/phone_button.dart';

class BreakdownScreen extends ConsumerStatefulWidget {
  const BreakdownScreen({super.key, required this.vehicleId});
  final String vehicleId;

  @override
  ConsumerState<BreakdownScreen> createState() => _BreakdownScreenState();
}

class _BreakdownScreenState extends ConsumerState<BreakdownScreen> {
  Position? _position;
  String? _address;
  bool _loadingLocation = false;

  @override
  void initState() {
    super.initState();
    _fetchLocation();
  }

  Future<void> _fetchLocation() async {
    setState(() => _loadingLocation = true);
    try {
      final pos = await LocationService.getCurrentPosition();
      if (pos != null && mounted) {
        setState(() => _position = pos);
        final addr = await LocationService.getAddress(pos);
        if (mounted) setState(() => _address = addr);
      }
    } catch (_) {}
    if (mounted) setState(() => _loadingLocation = false);
  }

  @override
  Widget build(BuildContext context) {
    final vehiclesAsync = ref.watch(vehiclesProvider);
    final profileAsync = ref.watch(profileProvider);

    return vehiclesAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicles) {
        final vehicle = vehicles
            .where((v) => v.id == widget.vehicleId)
            .firstOrNull;
        if (vehicle == null) {
          return const Scaffold(
              body: Center(child: Text('Vehicle not found')));
        }
        final profile = profileAsync.valueOrNull;

        return Scaffold(
          body: Column(
            children: [
              // Orange gradient header
              Container(
                decoration: const BoxDecoration(
                  gradient: AppGradients.emergencyBreakdown,
                ),
                child: SafeArea(
                  bottom: false,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back_rounded,
                                  color: Colors.white),
                              onPressed: () => Navigator.pop(context),
                            ),
                            Expanded(
                              child: Text(
                                "I've Broken Down",
                                style: AppTextStyles.heading
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Image.asset(
                          'assets/images/rescue-character.png',
                          height: 80,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              // Body
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Primary call button
                      if (vehicle.breakdownContact.isNotEmpty)
                        PhoneButton(
                          label:
                              'Call ${vehicle.breakdownProvider.isNotEmpty ? vehicle.breakdownProvider : "Breakdown"}',
                          phoneNumber: vehicle.breakdownContact,
                          color: AppColors.emergencyOrange,
                          large: true,
                        ),

                      if (vehicle.recoveryContact.isNotEmpty) ...[
                        const SizedBox(height: 12),
                        PhoneButton(
                          label: 'Call Recovery',
                          phoneNumber: vehicle.recoveryContact,
                          color: AppColors.primary,
                          large: true,
                        ),
                      ],

                      // Location
                      const SizedBox(height: 24),
                      Text('Your Location', style: AppTextStyles.subheading),
                      const SizedBox(height: 8),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (_loadingLocation)
                                const Row(
                                  children: [
                                    SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                          strokeWidth: 2),
                                    ),
                                    SizedBox(width: 12),
                                    Text('Getting location...'),
                                  ],
                                )
                              else if (_position != null) ...[
                                Row(
                                  children: [
                                    const Icon(Icons.location_on_rounded,
                                        color: AppColors.emergencyOrange),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      child: Text(
                                        _address ?? 'Location found',
                                        style: AppTextStyles.bodyBold,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  LocationService.formatCoordinates(
                                      _position!),
                                  style: AppTextStyles.caption,
                                ),
                                const SizedBox(height: 8),
                                OutlinedButton.icon(
                                  onPressed: () {
                                    final text = _address != null
                                        ? '$_address\n${LocationService.formatCoordinates(_position!)}'
                                        : LocationService.formatCoordinates(
                                            _position!);
                                    Clipboard.setData(
                                        ClipboardData(text: text));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Location copied to clipboard')),
                                    );
                                  },
                                  icon: const Icon(Icons.copy_rounded),
                                  label: const Text('Copy Location'),
                                ),
                              ] else
                                TextButton.icon(
                                  onPressed: _fetchLocation,
                                  icon: const Icon(Icons.location_searching),
                                  label: const Text('Get Location'),
                                ),
                            ],
                          ),
                        ),
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
                              _DetailRow('Vehicle',
                                  '${vehicle.make} ${vehicle.model}'),
                              _DetailRow('Colour', vehicle.colour),
                              _DetailRow('Fuel', vehicle.fuelType),
                              if (vehicle.breakdownMembershipNumber
                                  .isNotEmpty)
                                _DetailRow('Membership No.',
                                    vehicle.breakdownMembershipNumber),
                            ],
                          ),
                        ),
                      ),

                      // Emergency contact
                      if (profile != null &&
                          profile.emergencyContactPhone.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        Text('Emergency Contact',
                            style: AppTextStyles.subheading),
                        const SizedBox(height: 8),
                        PhoneButton(
                          label:
                              'Call ${profile.emergencyContactName.isNotEmpty ? profile.emergencyContactName : "Emergency Contact"}',
                          phoneNumber: profile.emergencyContactPhone,
                          color: AppColors.primary,
                          large: true,
                        ),
                      ],

                      // 999 fallback
                      const SizedBox(height: 24),
                      Card(
                        color: AppColors.softRed,
                        child: ListTile(
                          leading: const Icon(Icons.emergency_rounded,
                              color: AppColors.emergencyRed),
                          title: Text('Emergency Services',
                              style: AppTextStyles.bodyBold),
                          subtitle: const Text('Call 999 if in danger'),
                          trailing: IconButton(
                            icon: const Icon(Icons.phone_rounded,
                                color: AppColors.emergencyRed, size: 28),
                            onPressed: () => makePhoneCall('999'),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
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
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Expanded(
            child: Text(value, style: AppTextStyles.bodyBold),
          ),
        ],
      ),
    );
  }
}
