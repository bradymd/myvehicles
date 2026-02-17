import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/mot_record.dart';
import 'package:my_vehicles/providers/mot_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/utils/id_generator.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/widgets/section_header.dart';

class AddMOTScreen extends ConsumerStatefulWidget {
  const AddMOTScreen({
    super.key,
    required this.vehicleId,
    this.editRecordId,
  });

  final String vehicleId;
  final String? editRecordId;

  @override
  ConsumerState<AddMOTScreen> createState() => _AddMOTScreenState();
}

class _AddMOTScreenState extends ConsumerState<AddMOTScreen> {
  final _formKey = GlobalKey<FormState>();
  final _testDateController = TextEditingController();
  final _expiryDateController = TextEditingController();
  final _testCentreController = TextEditingController();
  final _mileageController = TextEditingController();
  String _result = 'pass';
  final _advisoriesController = TextEditingController();

  bool _isEditing = false;

  bool get isExistingRecord => widget.editRecordId != null;

  @override
  void initState() {
    super.initState();
    // New records go straight to edit mode
    if (!isExistingRecord) {
      _isEditing = true;
    }
  }

  @override
  void dispose() {
    _testDateController.dispose();
    _expiryDateController.dispose();
    _testCentreController.dispose();
    _mileageController.dispose();
    _advisoriesController.dispose();
    super.dispose();
  }

  MOTRecord? _getRecord() {
    final records =
        ref.read(motRecordsProvider(widget.vehicleId)).valueOrNull ?? [];
    return records.where((r) => r.id == widget.editRecordId).firstOrNull;
  }

  void _startEditing() {
    final record = _getRecord();
    if (record == null) return;

    _testDateController.text = record.testDate;
    _expiryDateController.text = record.expiryDate;
    _testCentreController.text = record.testCentre;
    _mileageController.text =
        record.mileage > 0 ? record.mileage.toString() : '';
    _result = record.result;
    _advisoriesController.text = record.advisories;
    setState(() => _isEditing = true);
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

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final record = MOTRecord(
      id: widget.editRecordId ?? generateId(),
      vehicleId: widget.vehicleId,
      testDate: _testDateController.text.trim(),
      expiryDate: _expiryDateController.text.trim(),
      testCentre: _testCentreController.text.trim(),
      mileage: int.tryParse(_mileageController.text.trim()) ?? 0,
      result: _result,
      advisories: _advisoriesController.text.trim(),
    );

    final notifier =
        ref.read(motRecordsProvider(widget.vehicleId).notifier);
    if (isExistingRecord) {
      await notifier.updateRecord(record);
      setState(() => _isEditing = false);
    } else {
      await notifier.addRecord(record);
      if (mounted) context.pop();
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete MOT Record?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(motRecordsProvider(widget.vehicleId).notifier)
                  .deleteRecord(widget.editRecordId!);
              Navigator.pop(ctx);
              context.pop();
            },
            child: const Text('Delete',
                style: TextStyle(color: AppColors.danger)),
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
          SizedBox(
              width: 130,
              child: Text(label, style: AppTextStyles.caption)),
          Expanded(child: Text(value, style: AppTextStyles.bodyBold)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recordsAsync = ref.watch(motRecordsProvider(widget.vehicleId));
    final vehicle = ref.watch(vehiclesProvider).valueOrNull
        ?.where((v) => v.id == widget.vehicleId)
        .firstOrNull;

    // For new records, just show the form
    if (!isExistingRecord) {
      return AppScaffold(
        title: 'My Vehicles',
        centerTitle: true,
        showBackButton: true,
        showMenuButton: false,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _buildForm(vehicle),
          ),
        ),
      );
    }

    return recordsAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (records) {
        final record =
            records.where((r) => r.id == widget.editRecordId).firstOrNull;
        if (record == null) {
          return AppScaffold(
            title: 'My Vehicles',
            showBackButton: true,
            body: const Center(child: Text('Record not found')),
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
                    icon: const Icon(Icons.edit_rounded,
                        color: Colors.white),
                    onPressed: _startEditing,
                  ),
                ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _isEditing
                ? Form(
                    key: _formKey,
                    child: _buildForm(vehicle),
                  )
                : _buildDisplay(record, vehicle),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(MOTRecord record, Vehicle? vehicle) {
    final passed = record.result == 'pass';
    final resultColor = passed ? AppColors.success : AppColors.danger;
    final resultIcon = passed
        ? Icons.check_circle_rounded
        : Icons.cancel_rounded;
    final resultLabel = passed ? 'PASS' : 'FAIL';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
            title: 'MOT Details', icon: Icons.verified_rounded),
        if (vehicle != null) ...[
          _infoRow('Vehicle', vehicle.shortDescription),
          _infoRow('Registration', vehicle.registration.toUpperCase()),
        ],
        // Test Date with PASS/FAIL badge
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  width: 130,
                  child: Text('Test Date', style: AppTextStyles.caption)),
              Expanded(
                child: Text(formatDateUK(record.testDate),
                    style: AppTextStyles.bodyBold),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                decoration: BoxDecoration(
                  color: passed ? AppColors.softGreen : AppColors.softRed,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(resultIcon, color: resultColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      resultLabel,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w800,
                        color: resultColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        _infoRow('Expiry Date', formatDateUK(record.expiryDate)),
        _infoRow('Test Centre', record.testCentre),
        _infoRow('Mileage',
            record.mileage > 0 ? '${record.mileage} miles' : ''),

        if (record.advisories.isNotEmpty) ...[
          const SizedBox(height: 16),
          const SectionHeader(
              title: 'Advisories', icon: Icons.warning_amber_rounded),
          const SizedBox(height: 4),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: AppColors.softOrange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              record.advisories,
              style: AppTextStyles.body.copyWith(fontSize: 13),
            ),
          ),
        ],

        DocumentAttachments(
          parentType: 'mot',
          parentId: widget.editRecordId!,
        ),

        const SizedBox(height: 32),
        Center(
          child: TextButton.icon(
            onPressed: _confirmDelete,
            icon: const Icon(Icons.delete_outline_rounded,
                color: AppColors.danger),
            label: const Text('Delete this MOT Record',
                style: TextStyle(color: AppColors.danger)),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildForm(Vehicle? vehicle) {
    final vehicleLabel = vehicle != null
        ? (vehicle.registration.isNotEmpty
            ? '${vehicle.registration.toUpperCase()} \u2022 ${vehicle.shortDescription}'
            : vehicle.shortDescription)
        : '';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
            title: 'MOT Details', icon: Icons.verified_rounded),
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
          controller: _testDateController,
          decoration: InputDecoration(
            labelText: 'Test Date',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_rounded,
                  color: AppColors.primary),
              onPressed: () => _pickDate(_testDateController),
            ),
          ),
          readOnly: true,
          onTap: () => _pickDate(_testDateController),
          validator: (v) =>
              v == null || v.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _expiryDateController,
          decoration: InputDecoration(
            labelText: 'Expiry Date',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_rounded,
                  color: AppColors.primary),
              onPressed: () => _pickDate(_expiryDateController),
            ),
          ),
          readOnly: true,
          onTap: () => _pickDate(_expiryDateController),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _testCentreController,
          decoration:
              const InputDecoration(labelText: 'Test Centre'),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _mileageController,
          decoration: const InputDecoration(labelText: 'Mileage'),
          keyboardType: TextInputType.number,
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _result,
          decoration: const InputDecoration(labelText: 'Result'),
          items: MOTResult.values
              .map((r) => DropdownMenuItem(
                  value: r.name, child: Text(r.label)))
              .toList(),
          onChanged: (v) => setState(() => _result = v!),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _advisoriesController,
          decoration: const InputDecoration(
              labelText: 'Advisories / Notes'),
          maxLines: 4,
        ),

        if (isExistingRecord)
          DocumentAttachments(
            parentType: 'mot',
            parentId: widget.editRecordId!,
          ),

        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _save,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child:
                Text(isExistingRecord ? 'Save Changes' : 'Add MOT Record'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
