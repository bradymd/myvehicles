import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/theme/app_colors.dart';

class InsuranceInfoScreen extends ConsumerStatefulWidget {
  const InsuranceInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<InsuranceInfoScreen> createState() =>
      _InsuranceInfoScreenState();
}

class _InsuranceInfoScreenState extends ConsumerState<InsuranceInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _insurerCtrl;
  late TextEditingController _policyCtrl;
  late TextEditingController _renewalDateCtrl;
  late TextEditingController _driversCtrl;
  late TextEditingController _annualCostCtrl;
  InsuranceType _selectedInsuranceType = InsuranceType.none;

  @override
  void initState() {
    super.initState();
    _insurerCtrl = TextEditingController();
    _policyCtrl = TextEditingController();
    _renewalDateCtrl = TextEditingController();
    _driversCtrl = TextEditingController();
    _annualCostCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _insurerCtrl.dispose();
    _policyCtrl.dispose();
    _renewalDateCtrl.dispose();
    _driversCtrl.dispose();
    _annualCostCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _insurerCtrl.text = vehicle.insurer;
    _policyCtrl.text = vehicle.insurancePolicyNumber;
    _renewalDateCtrl.text = vehicle.insuranceRenewalDate;
    _driversCtrl.text = vehicle.insuredDrivers;
    _annualCostCtrl.text =
        vehicle.insuranceAnnualCost > 0
            ? vehicle.insuranceAnnualCost.toStringAsFixed(2)
            : '';
    _selectedInsuranceType = InsuranceType.values.firstWhere(
      (e) => e.name == vehicle.insuranceType,
      orElse: () => InsuranceType.none,
    );
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    final updated = vehicle.copyWith(
      insurer: _insurerCtrl.text.trim(),
      insurancePolicyNumber: _policyCtrl.text.trim(),
      insuranceRenewalDate: _renewalDateCtrl.text.trim(),
      insuranceType: _selectedInsuranceType.name,
      insuredDrivers: _driversCtrl.text.trim(),
      insuranceAnnualCost:
          double.tryParse(_annualCostCtrl.text.trim()) ?? 0,
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    setState(() => _isEditing = false);
  }

  void _cancel() => setState(() => _isEditing = false);

  Future<void> _applyExtractedData(
      Vehicle vehicle, Map<String, String> data) async {
    // Only fill fields that are currently empty — never overwrite existing data
    final updated = vehicle.copyWith(
      insurer: vehicle.insurer.isEmpty
          ? (data['insurer'] ?? vehicle.insurer)
          : vehicle.insurer,
      insurancePolicyNumber: vehicle.insurancePolicyNumber.isEmpty
          ? (data['policyNumber'] ?? vehicle.insurancePolicyNumber)
          : vehicle.insurancePolicyNumber,
      insuranceRenewalDate: vehicle.insuranceRenewalDate.isEmpty
          ? (data['renewalDate'] ?? vehicle.insuranceRenewalDate)
          : vehicle.insuranceRenewalDate,
      insuranceType: vehicle.insuranceType.isEmpty
          ? (data['insuranceType'] ?? vehicle.insuranceType)
          : vehicle.insuranceType,
      insuredDrivers: vehicle.insuredDrivers.isEmpty
          ? (data['insuredDrivers'] ?? vehicle.insuredDrivers)
          : vehicle.insuredDrivers,
      insuranceAnnualCost: vehicle.insuranceAnnualCost == 0 &&
              data.containsKey('annualCost')
          ? (double.tryParse(data['annualCost']!) ??
              vehicle.insuranceAnnualCost)
          : vehicle.insuranceAnnualCost,
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2040),
    );
    if (picked != null) {
      controller.text =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
    }
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

  Widget _buildDriversRow(String driversStr) {
    if (driversStr.isEmpty) return const SizedBox.shrink();

    final profiles = ref.watch(profilesProvider).valueOrNull ?? [];
    final profileNames = profiles
        .map((p) => p.name.trim().toLowerCase())
        .where((n) => n.isNotEmpty)
        .toSet();

    // Split drivers by comma, newline, or semicolon
    final drivers = driversStr
        .split(RegExp(r'[,;\n]'))
        .map((d) => d.trim())
        .where((d) => d.isNotEmpty)
        .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: 130,
              child: Text('Insured Drivers', style: AppTextStyles.caption)),
          Expanded(
            child: Wrap(
              spacing: 4,
              runSpacing: 4,
              children: [
                for (int i = 0; i < drivers.length; i++) ...[
                  if (profileNames.contains(drivers[i].trim().toLowerCase()))
                    GestureDetector(
                      onTap: () => context.push('/profile'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: AppColors.softGreen,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          drivers[i],
                          style: AppTextStyles.bodyBold.copyWith(
                            color: AppColors.success,
                          ),
                        ),
                      ),
                    )
                  else
                    Text(drivers[i], style: AppTextStyles.bodyBold),
                  if (i < drivers.length - 1)
                    Text(', ', style: AppTextStyles.bodyBold),
                ],
              ],
            ),
          ),
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
            title: '',
            showBackButton: true,
            body: const Center(child: Text('Vehicle not found')),
          );
        }

        return AppScaffold(
          title: _isEditing ? 'Editing Insurance' : 'Insurance Details',
          useOverlayNav: true,
          showBackButton: true,
          onBack: _isEditing ? _cancel : null,
          overlayFabIcon: _isEditing ? Icons.check_rounded : Icons.edit_rounded,
          overlayFabOnPressed: _isEditing ? _save : () => _startEditing(vehicle),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _isEditing ? _buildForm(vehicle) : _buildDisplay(vehicle),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(Vehicle vehicle) {
    final insuranceTypeLabel = InsuranceType.values
        .firstWhere(
          (e) => e.name == vehicle.insuranceType,
          orElse: () => InsuranceType.none,
        )
        .label;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow('Vehicle', vehicle.registration.isNotEmpty
            ? '${vehicle.registration.toUpperCase()} \u2022 ${vehicle.shortDescription}'
            : vehicle.shortDescription),
        _infoRow('Insurer', vehicle.insurer),
        _infoRow('Policy No.', vehicle.insurancePolicyNumber),
        _infoRow('Renewal Date', vehicle.insuranceRenewalDate),
        _infoRow('Type', insuranceTypeLabel),
        _buildDriversRow(vehicle.insuredDrivers),
        _infoRow(
          'Annual Cost',
          vehicle.insuranceAnnualCost > 0
              ? '\u00A3${vehicle.insuranceAnnualCost.toStringAsFixed(2)}'
              : '',
        ),
        DocumentAttachments(
          parentType: 'insurance',
          parentId: widget.vehicleId,
          onDataExtracted: (data) => _applyExtractedData(vehicle, data),
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
          const SizedBox(height: 12),
          TextFormField(
            controller: _insurerCtrl,
            decoration: const InputDecoration(labelText: 'Insurer'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _policyCtrl,
            decoration: const InputDecoration(labelText: 'Policy Number'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _renewalDateCtrl,
            decoration: InputDecoration(
              labelText: 'Renewal Date',
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: () => _pickDate(_renewalDateCtrl),
              ),
            ),
            readOnly: true,
            onTap: () => _pickDate(_renewalDateCtrl),
          ),
          const SizedBox(height: 12),
          DropdownButtonFormField<InsuranceType>(
            initialValue: _selectedInsuranceType,
            decoration: const InputDecoration(labelText: 'Insurance Type'),
            items: InsuranceType.values
                .map((t) =>
                    DropdownMenuItem(value: t, child: Text(t.label)))
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => _selectedInsuranceType = v);
            },
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _driversCtrl,
            decoration: const InputDecoration(labelText: 'Insured Drivers'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _annualCostCtrl,
            decoration: const InputDecoration(
              labelText: 'Annual Cost',
              prefixText: '\u00A3 ',
            ),
            keyboardType: TextInputType.number,
          ),
        ],
      ),
    );
  }
}
