import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/phone_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/widgets/section_header.dart';

class BreakdownInfoScreen extends ConsumerStatefulWidget {
  const BreakdownInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<BreakdownInfoScreen> createState() =>
      _BreakdownInfoScreenState();
}

class _BreakdownInfoScreenState extends ConsumerState<BreakdownInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _providerCtrl;
  late TextEditingController _membershipCtrl;
  late TextEditingController _contactCtrl;
  late TextEditingController _notesCtrl;

  @override
  void initState() {
    super.initState();
    _providerCtrl = TextEditingController();
    _membershipCtrl = TextEditingController();
    _contactCtrl = TextEditingController();
    _notesCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _providerCtrl.dispose();
    _membershipCtrl.dispose();
    _contactCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _providerCtrl.text = vehicle.breakdownProvider;
    _membershipCtrl.text = vehicle.breakdownMembershipNumber;
    _contactCtrl.text = vehicle.breakdownContact;
    _notesCtrl.text = vehicle.breakdownNotes;
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    final updated = vehicle.copyWith(
      breakdownProvider: _providerCtrl.text.trim(),
      breakdownMembershipNumber: _membershipCtrl.text.trim(),
      breakdownContact: _contactCtrl.text.trim(),
      breakdownNotes: _notesCtrl.text.trim(),
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    setState(() => _isEditing = false);
  }

  void _cancel() => setState(() => _isEditing = false);

  void _confirmCall(String number) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Call this number?'),
        content: Text(number),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(ctx);
              makePhoneCall(number);
            },
            child:
                const Text('Call', style: TextStyle(color: AppColors.primary)),
          ),
        ],
      ),
    );
  }

  Widget _infoRow(String label, String value) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 130, child: Text(label, style: AppTextStyles.caption)),
          Expanded(child: Text(value, style: AppTextStyles.bodyBold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final vehiclesAsync = ref.watch(vehiclesProvider);

    return vehiclesAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (vehicles) {
        final vehicle =
            vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
        if (vehicle == null) {
          return AppScaffold(
            title: 'My Vehicles',
            showBackButton: true,
            body: const Center(child: Text('Vehicle not found')),
          );
        }

        return AppScaffold(
          title: 'My Vehicles',
          centerTitle: true,
          showBackButton: true,
          actions: _isEditing
              ? [
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: _cancel,
                  ),
                  IconButton(
                    icon: const Icon(Icons.check, color: Colors.white),
                    onPressed: _save,
                  ),
                ]
              : [
                  IconButton(
                    icon: const Icon(Icons.edit_rounded, color: Colors.white),
                    onPressed: () => _startEditing(vehicle),
                  ),
                ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _isEditing
                ? _buildForm(vehicle)
                : _buildDisplay(vehicle),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(Vehicle vehicle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
            title: 'Breakdown Cover', icon: Icons.car_repair_rounded),
        _infoRow('Vehicle', vehicle.shortDescription),
        _infoRow('Registration', vehicle.registration.toUpperCase()),
        _infoRow('Provider', vehicle.breakdownProvider),
        _infoRow('Membership No.', vehicle.breakdownMembershipNumber),
        _infoRow('Contact', vehicle.breakdownContact),
        if (vehicle.breakdownNotes.isNotEmpty) ...[
          const SizedBox(height: 12),
          const SectionHeader(
              title: 'Notes', icon: Icons.notes_rounded),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.softOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              vehicle.breakdownNotes,
              style: AppTextStyles.body.copyWith(fontSize: 13),
            ),
          ),
        ],
        if (vehicle.breakdownContact.isNotEmpty) ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () => _confirmCall(vehicle.breakdownContact),
              icon: const Icon(Icons.phone_rounded),
              label: const Text('Call Breakdown'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
        ],
        DocumentAttachments(
          parentType: 'breakdown',
          parentId: widget.vehicleId,
        ),
      ],
    );
  }

  Widget _buildForm(Vehicle vehicle) {
    final vehicleLabel = vehicle.registration.isNotEmpty
        ? '${vehicle.registration.toUpperCase()} \u2022 ${vehicle.shortDescription}'
        : vehicle.shortDescription;

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
              title: 'Breakdown Cover', icon: Icons.car_repair_rounded),
          const SizedBox(height: 8),
          if (vehicleLabel.isNotEmpty)
            TextFormField(
              initialValue: vehicleLabel,
              decoration: const InputDecoration(
                labelText: 'Vehicle',
                suffixIcon: Icon(Icons.lock_outline_rounded,
                    size: 18, color: AppColors.textMuted),
              ),
              readOnly: true,
              style: AppTextStyles.bodyBold,
            ),
          if (vehicleLabel.isNotEmpty) const SizedBox(height: 12),
          TextFormField(
            controller: _providerCtrl,
            decoration: const InputDecoration(labelText: 'Provider'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _membershipCtrl,
            decoration: const InputDecoration(labelText: 'Membership Number'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _contactCtrl,
            decoration: const InputDecoration(labelText: 'Contact Phone'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesCtrl,
            decoration: const InputDecoration(
                labelText: 'Notes'),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
