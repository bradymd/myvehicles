import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/widgets/section_header.dart';

class PurchaseInfoScreen extends ConsumerStatefulWidget {
  const PurchaseInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<PurchaseInfoScreen> createState() => _PurchaseInfoScreenState();
}

class _PurchaseInfoScreenState extends ConsumerState<PurchaseInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _purchaseDateCtrl;
  late TextEditingController _priceCtrl;
  late TextEditingController _purchasedFromCtrl;
  late TextEditingController _financeCompanyCtrl;
  late TextEditingController _agreementNumberCtrl;
  late TextEditingController _depositCtrl;
  late TextEditingController _monthlyPaymentCtrl;
  late TextEditingController _numberOfPaymentsCtrl;
  late TextEditingController _financeStartDateCtrl;
  late TextEditingController _financeEndDateCtrl;
  late TextEditingController _balloonPaymentCtrl;
  late TextEditingController _mileageAllowanceCtrl;
  late TextEditingController _lessorCtrl;
  late TextEditingController _agreementHolderCtrl;
  late TextEditingController _ownershipNotesCtrl;
  OwnershipType _selectedOwnership = OwnershipType.owned;

  @override
  void initState() {
    super.initState();
    _purchaseDateCtrl = TextEditingController();
    _priceCtrl = TextEditingController();
    _purchasedFromCtrl = TextEditingController();
    _financeCompanyCtrl = TextEditingController();
    _agreementNumberCtrl = TextEditingController();
    _depositCtrl = TextEditingController();
    _monthlyPaymentCtrl = TextEditingController();
    _numberOfPaymentsCtrl = TextEditingController();
    _financeStartDateCtrl = TextEditingController();
    _financeEndDateCtrl = TextEditingController();
    _balloonPaymentCtrl = TextEditingController();
    _mileageAllowanceCtrl = TextEditingController();
    _lessorCtrl = TextEditingController();
    _agreementHolderCtrl = TextEditingController();
    _ownershipNotesCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _purchaseDateCtrl.dispose();
    _priceCtrl.dispose();
    _purchasedFromCtrl.dispose();
    _financeCompanyCtrl.dispose();
    _agreementNumberCtrl.dispose();
    _depositCtrl.dispose();
    _monthlyPaymentCtrl.dispose();
    _numberOfPaymentsCtrl.dispose();
    _financeStartDateCtrl.dispose();
    _financeEndDateCtrl.dispose();
    _balloonPaymentCtrl.dispose();
    _mileageAllowanceCtrl.dispose();
    _lessorCtrl.dispose();
    _agreementHolderCtrl.dispose();
    _ownershipNotesCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _purchaseDateCtrl.text = vehicle.purchaseDate;
    _priceCtrl.text =
        vehicle.purchasePrice > 0
            ? vehicle.purchasePrice.toStringAsFixed(2)
            : '';
    _purchasedFromCtrl.text = vehicle.purchasedFrom;
    _financeCompanyCtrl.text = vehicle.financeCompany;
    _agreementNumberCtrl.text = vehicle.agreementNumber;
    _depositCtrl.text =
        vehicle.deposit > 0 ? vehicle.deposit.toStringAsFixed(2) : '';
    _monthlyPaymentCtrl.text =
        vehicle.monthlyPayment > 0
            ? vehicle.monthlyPayment.toStringAsFixed(2)
            : '';
    _numberOfPaymentsCtrl.text =
        vehicle.numberOfPayments > 0
            ? vehicle.numberOfPayments.toString()
            : '';
    _financeStartDateCtrl.text = vehicle.financeStartDate;
    _financeEndDateCtrl.text = vehicle.financeEndDate;
    _balloonPaymentCtrl.text =
        vehicle.balloonPayment > 0
            ? vehicle.balloonPayment.toStringAsFixed(2)
            : '';
    _mileageAllowanceCtrl.text =
        vehicle.annualMileageAllowance > 0
            ? vehicle.annualMileageAllowance.toString()
            : '';
    _lessorCtrl.text = vehicle.lessor;
    _agreementHolderCtrl.text = vehicle.agreementHolder;
    _ownershipNotesCtrl.text = vehicle.ownershipNotes;
    _selectedOwnership = OwnershipType.values.firstWhere(
      (e) => e.name == vehicle.ownership,
      orElse: () => OwnershipType.owned,
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
      purchaseDate: _purchaseDateCtrl.text.trim(),
      purchasePrice: double.tryParse(_priceCtrl.text.trim()) ?? 0,
      purchasedFrom: _purchasedFromCtrl.text.trim(),
      ownership: _selectedOwnership.name,
      financeCompany: _financeCompanyCtrl.text.trim(),
      agreementNumber: _agreementNumberCtrl.text.trim(),
      deposit: double.tryParse(_depositCtrl.text.trim()) ?? 0,
      monthlyPayment:
          double.tryParse(_monthlyPaymentCtrl.text.trim()) ?? 0,
      numberOfPayments:
          int.tryParse(_numberOfPaymentsCtrl.text.trim()) ?? 0,
      financeStartDate: _financeStartDateCtrl.text.trim(),
      financeEndDate: _financeEndDateCtrl.text.trim(),
      balloonPayment:
          double.tryParse(_balloonPaymentCtrl.text.trim()) ?? 0,
      annualMileageAllowance:
          int.tryParse(_mileageAllowanceCtrl.text.trim()) ?? 0,
      lessor: _lessorCtrl.text.trim(),
      agreementHolder: _agreementHolderCtrl.text.trim(),
      ownershipNotes: _ownershipNotesCtrl.text.trim(),
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    setState(() => _isEditing = false);
  }

  void _cancel() => setState(() => _isEditing = false);

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
          SizedBox(width: 140, child: Text(label, style: AppTextStyles.caption)),
          Expanded(child: Text(value, style: AppTextStyles.bodyBold)),
        ],
      ),
    );
  }

  String _moneyStr(double v) =>
      v > 0 ? '\u00A3${v.toStringAsFixed(2)}' : '';

  bool get _hasFinance =>
      _selectedOwnership != OwnershipType.owned;

  bool get _hasBalloon =>
      _selectedOwnership == OwnershipType.pcp;

  bool get _hasMileageLimit =>
      _selectedOwnership == OwnershipType.pcp ||
      _selectedOwnership == OwnershipType.pch ||
      _selectedOwnership == OwnershipType.financed;

  bool get _isLease =>
      _selectedOwnership == OwnershipType.pch ||
      _selectedOwnership == OwnershipType.leased;

  String get _holderLabel => switch (_selectedOwnership) {
        OwnershipType.pch || OwnershipType.leased => 'Hirer',
        OwnershipType.financed => 'Lessee',
        OwnershipType.hp || OwnershipType.pcp => 'Agreement Holder',
        OwnershipType.owned => 'Owner',
      };

  String _holderLabelFor(Vehicle vehicle) {
    final type = OwnershipType.values.firstWhere(
      (e) => e.name == vehicle.ownership,
      orElse: () => OwnershipType.owned,
    );
    return switch (type) {
      OwnershipType.pch || OwnershipType.leased => 'Hirer',
      OwnershipType.financed => 'Lessee',
      OwnershipType.hp || OwnershipType.pcp => 'Agreement Holder',
      OwnershipType.owned => 'Owner',
    };
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
          title: '',
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
    final ownershipLabel = OwnershipType.values
        .firstWhere(
          (e) => e.name == vehicle.ownership,
          orElse: () => OwnershipType.owned,
        )
        .label;
    final isOwned = vehicle.ownership == OwnershipType.owned.name;
    final isPcp = vehicle.ownership == OwnershipType.pcp.name;
    final hasMileage = vehicle.ownership == OwnershipType.pcp.name ||
        vehicle.ownership == OwnershipType.pch.name ||
        vehicle.ownership == OwnershipType.financed.name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
            title: 'Ownership Details',
            icon: Icons.account_balance_rounded),
        _infoRow('Vehicle', vehicle.shortDescription),
        _infoRow('Registration', vehicle.registration.toUpperCase()),
        _infoRow('Ownership', ownershipLabel),

        if (isOwned) ...[
          _infoRow('Purchase Date', formatDateUK(vehicle.purchaseDate)),
          _infoRow('Purchase Price', _moneyStr(vehicle.purchasePrice)),
          _infoRow('Purchased From', vehicle.purchasedFrom),
        ],

        if (!isOwned) ...[
          const SizedBox(height: 8),
          _infoRow(
            _isLeaseType(vehicle) ? 'Leasing Company' : 'Finance Company',
            _isLeaseType(vehicle) ? vehicle.lessor : vehicle.financeCompany,
          ),
          _infoRow('Agreement No.', vehicle.agreementNumber),
          _infoRow(_holderLabelFor(vehicle), vehicle.agreementHolder),
          if (!_isLeaseType(vehicle))
            _infoRow('Vehicle Price', _moneyStr(vehicle.purchasePrice)),
          _infoRow(
            _isLeaseType(vehicle) ? 'Initial Rental' : 'Deposit',
            _moneyStr(vehicle.deposit),
          ),
          _infoRow('Monthly Payment', _moneyStr(vehicle.monthlyPayment)),
          if (vehicle.numberOfPayments > 0)
            _infoRow('No. of Payments', vehicle.numberOfPayments.toString()),
          _infoRow('Start Date', formatDateUK(vehicle.financeStartDate)),
          _infoRow('End Date', formatDateUK(vehicle.financeEndDate)),
          if (isPcp)
            _infoRow(
                'Balloon / Final Payment', _moneyStr(vehicle.balloonPayment)),
          if (hasMileage && vehicle.annualMileageAllowance > 0)
            _infoRow('Annual Mileage',
                '${vehicle.annualMileageAllowance} miles'),
          if (!_isLeaseType(vehicle))
            _infoRow('Dealer / Supplier', vehicle.purchasedFrom),

          // Finance/lease end date warning
          if (vehicle.financeEndDate.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildDateBanner(vehicle),
          ],
        ],

        // Notes
        if (vehicle.ownershipNotes.isNotEmpty) ...[
          const SizedBox(height: 16),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.softOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Notes', style: AppTextStyles.caption),
                const SizedBox(height: 4),
                Text(vehicle.ownershipNotes, style: AppTextStyles.body),
              ],
            ),
          ),
        ],

        DocumentAttachments(
          parentType: 'purchase',
          parentId: widget.vehicleId,
        ),
      ],
    );
  }

  bool _isLeaseType(Vehicle vehicle) =>
      vehicle.ownership == OwnershipType.pch.name ||
      vehicle.ownership == OwnershipType.leased.name;

  Widget _buildDateBanner(Vehicle vehicle) {
    final dateStr = vehicle.financeEndDate;
    final days = daysUntil(dateStr);
    final isLeaseType = _isLeaseType(vehicle);
    final color = days < 0
        ? AppColors.danger
        : days <= 30
            ? AppColors.warning
            : AppColors.success;
    final bgColor = days < 0
        ? AppColors.softRed
        : days <= 30
            ? AppColors.softOrange
            : AppColors.softGreen;
    final icon = days < 0
        ? Icons.error_rounded
        : days <= 30
            ? Icons.warning_amber_rounded
            : Icons.check_circle_rounded;
    final label = isLeaseType ? 'Lease' : 'Agreement';
    final text = days < 0
        ? '$label ended ${-days} days ago'
        : '$label ends ${formatDateRelative(dateStr)}';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: color),
          const SizedBox(width: 8),
          Expanded(
            child: Text(text,
                style: AppTextStyles.bodyBold.copyWith(color: color)),
          ),
        ],
      ),
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
              title: 'Ownership Details',
              icon: Icons.account_balance_rounded),
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
          DropdownButtonFormField<OwnershipType>(
            initialValue: _selectedOwnership,
            decoration: const InputDecoration(labelText: 'Ownership Type'),
            items: OwnershipType.values
                .map((t) =>
                    DropdownMenuItem(value: t, child: Text(t.label)))
                .toList(),
            onChanged: (v) {
              if (v != null) setState(() => _selectedOwnership = v);
            },
          ),

          // Owned outright fields
          if (_selectedOwnership == OwnershipType.owned) ...[
            const SizedBox(height: 12),
            TextFormField(
              controller: _purchaseDateCtrl,
              decoration: InputDecoration(
                labelText: 'Purchase Date',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today_rounded,
                      color: AppColors.primary),
                  onPressed: () => _pickDate(_purchaseDateCtrl),
                ),
              ),
              readOnly: true,
              onTap: () => _pickDate(_purchaseDateCtrl),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _priceCtrl,
              decoration: const InputDecoration(
                labelText: 'Purchase Price',
                prefixText: '\u00A3 ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _purchasedFromCtrl,
              decoration:
                  const InputDecoration(labelText: 'Purchased From'),
            ),
          ],

          // Finance / lease fields (HP, PCP, PCH, Finance Lease, Leased)
          if (_hasFinance) ...[
            const SizedBox(height: 12),
            TextFormField(
              controller: _isLease ? _lessorCtrl : _financeCompanyCtrl,
              decoration: InputDecoration(
                  labelText:
                      _isLease ? 'Leasing Company' : 'Finance Company'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _agreementNumberCtrl,
              decoration:
                  const InputDecoration(labelText: 'Agreement Number'),
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _agreementHolderCtrl,
              decoration: InputDecoration(labelText: _holderLabel),
            ),
            if (!_isLease) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _priceCtrl,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Price',
                  prefixText: '\u00A3 ',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            const SizedBox(height: 12),
            TextFormField(
              controller: _depositCtrl,
              decoration: InputDecoration(
                labelText:
                    _isLease ? 'Initial Rental / Deposit' : 'Deposit',
                prefixText: '\u00A3 ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _monthlyPaymentCtrl,
              decoration: const InputDecoration(
                labelText: 'Monthly Payment',
                prefixText: '\u00A3 ',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _numberOfPaymentsCtrl,
              decoration: const InputDecoration(
                labelText: 'Number of Payments',
                hintText: 'e.g. 35',
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _financeStartDateCtrl,
                    decoration: InputDecoration(
                      labelText: 'Start Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today_rounded,
                            color: AppColors.primary),
                        onPressed: () =>
                            _pickDate(_financeStartDateCtrl),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _pickDate(_financeStartDateCtrl),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: TextFormField(
                    controller: _financeEndDateCtrl,
                    decoration: InputDecoration(
                      labelText: 'End Date',
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.calendar_today_rounded,
                            color: AppColors.primary),
                        onPressed: () =>
                            _pickDate(_financeEndDateCtrl),
                      ),
                    ),
                    readOnly: true,
                    onTap: () => _pickDate(_financeEndDateCtrl),
                  ),
                ),
              ],
            ),
            if (_hasBalloon) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _balloonPaymentCtrl,
                decoration: const InputDecoration(
                  labelText: 'Balloon / Final Payment',
                  prefixText: '\u00A3 ',
                ),
                keyboardType: TextInputType.number,
              ),
            ],
            if (_hasMileageLimit) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _mileageAllowanceCtrl,
                decoration: const InputDecoration(
                    labelText: 'Annual Mileage Allowance'),
                keyboardType: TextInputType.number,
              ),
            ],
            if (!_isLease) ...[
              const SizedBox(height: 12),
              TextFormField(
                controller: _purchasedFromCtrl,
                decoration:
                    const InputDecoration(labelText: 'Dealer / Supplier'),
              ),
            ],
          ],

          // Notes — all ownership types
          const SizedBox(height: 16),
          TextFormField(
            controller: _ownershipNotesCtrl,
            decoration: const InputDecoration(
              labelText: 'Notes',
              hintText: 'e.g. Includes servicing, excess mileage terms',
              alignLabelWithHint: true,
            ),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}
