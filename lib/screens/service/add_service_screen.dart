import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/service_entry.dart';
import 'package:my_vehicles/providers/service_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/utils/id_generator.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/widgets/section_header.dart';

class AddServiceScreen extends ConsumerStatefulWidget {
  const AddServiceScreen({
    super.key,
    required this.vehicleId,
    this.editEntryId,
  });

  final String vehicleId;
  final String? editEntryId;

  @override
  ConsumerState<AddServiceScreen> createState() => _AddServiceScreenState();
}

class _AddServiceScreenState extends ConsumerState<AddServiceScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  String _type = 'service';
  final _descriptionController = TextEditingController();
  final _costController = TextEditingController();
  final _garageController = TextEditingController();
  final _mileageController = TextEditingController();
  final _nextServiceDateController = TextEditingController();
  final _nextServiceMileageController = TextEditingController();

  bool _isEditing = false;

  bool get isExistingEntry => widget.editEntryId != null;

  @override
  void initState() {
    super.initState();
    // New entries go straight to edit mode
    if (!isExistingEntry) {
      _isEditing = true;
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    _descriptionController.dispose();
    _costController.dispose();
    _garageController.dispose();
    _mileageController.dispose();
    _nextServiceDateController.dispose();
    _nextServiceMileageController.dispose();
    super.dispose();
  }

  ServiceEntry? _getEntry() {
    final entries =
        ref.read(serviceEntriesProvider(widget.vehicleId)).valueOrNull ?? [];
    return entries.where((e) => e.id == widget.editEntryId).firstOrNull;
  }

  void _startEditing() {
    final entry = _getEntry();
    if (entry == null) return;

    _dateController.text = entry.date;
    _type = entry.type;
    _descriptionController.text = entry.description;
    _costController.text = entry.cost > 0 ? entry.cost.toString() : '';
    _garageController.text = entry.garage;
    _mileageController.text =
        entry.mileage > 0 ? entry.mileage.toString() : '';
    _nextServiceDateController.text = entry.nextServiceDate;
    _nextServiceMileageController.text =
        entry.nextServiceMileage > 0
            ? entry.nextServiceMileage.toString()
            : '';
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

    final entry = ServiceEntry(
      id: widget.editEntryId ?? generateId(),
      vehicleId: widget.vehicleId,
      date: _dateController.text.trim(),
      type: _type,
      description: _descriptionController.text.trim(),
      cost: double.tryParse(_costController.text.trim()) ?? 0,
      garage: _garageController.text.trim(),
      mileage: int.tryParse(_mileageController.text.trim()) ?? 0,
      nextServiceDate: _nextServiceDateController.text.trim(),
      nextServiceMileage:
          int.tryParse(_nextServiceMileageController.text.trim()) ?? 0,
    );

    final notifier =
        ref.read(serviceEntriesProvider(widget.vehicleId).notifier);
    if (isExistingEntry) {
      await notifier.updateEntry(entry);
      setState(() => _isEditing = false);
    } else {
      await notifier.addEntry(entry);
      if (mounted) context.pop();
    }
  }

  void _confirmDelete() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Service Entry?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              ref
                  .read(serviceEntriesProvider(widget.vehicleId).notifier)
                  .deleteEntry(widget.editEntryId!);
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
    final entriesAsync = ref.watch(serviceEntriesProvider(widget.vehicleId));
    final vehicle = ref.watch(vehiclesProvider).valueOrNull
        ?.where((v) => v.id == widget.vehicleId)
        .firstOrNull;

    // For new entries, just show the form
    if (!isExistingEntry) {
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

    return entriesAsync.when(
      loading: () => const Scaffold(
          body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(body: Center(child: Text('Error: $e'))),
      data: (entries) {
        final entry =
            entries.where((e) => e.id == widget.editEntryId).firstOrNull;
        if (entry == null) {
          return AppScaffold(
            title: 'My Vehicles',
            showBackButton: true,
            body: const Center(child: Text('Entry not found')),
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
                : _buildDisplay(entry, vehicle),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(ServiceEntry entry, Vehicle? vehicle) {
    final typeLabel = ServiceType.values
        .where((t) => t.name == entry.type)
        .firstOrNull
        ?.label ?? entry.type;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(
            title: 'Service Details', icon: Icons.build_rounded),
        if (vehicle != null) ...[
          _infoRow('Vehicle', vehicle.shortDescription),
          _infoRow('Registration', vehicle.registration.toUpperCase()),
        ],
        _infoRow('Date', formatDateUK(entry.date)),
        _infoRow('Type', typeLabel),
        _infoRow('Description', entry.description),
        _infoRow('Cost',
            entry.cost > 0 ? '\u00A3${entry.cost.toStringAsFixed(2)}' : ''),
        _infoRow('Garage', entry.garage),
        _infoRow('Mileage',
            entry.mileage > 0 ? '${entry.mileage} miles' : ''),

        if (entry.nextServiceDate.isNotEmpty ||
            entry.nextServiceMileage > 0) ...[
          const SizedBox(height: 16),
          const SectionHeader(
              title: 'Next Service', icon: Icons.event_repeat_rounded),
          _infoRow(
              'Next Service Date', formatDateUK(entry.nextServiceDate)),
          _infoRow(
            'Next Service Mileage',
            entry.nextServiceMileage > 0
                ? '${entry.nextServiceMileage} miles'
                : '',
          ),
        ],

        DocumentAttachments(
          parentType: 'service',
          parentId: widget.editEntryId!,
        ),

        const SizedBox(height: 32),
        Center(
          child: TextButton.icon(
            onPressed: _confirmDelete,
            icon: const Icon(Icons.delete_outline_rounded,
                color: AppColors.danger),
            label: const Text('Delete this Service Entry',
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
            title: 'Service Details', icon: Icons.build_rounded),
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
          controller: _dateController,
          decoration: InputDecoration(
            labelText: 'Date',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_rounded,
                  color: AppColors.primary),
              onPressed: () => _pickDate(_dateController),
            ),
          ),
          readOnly: true,
          onTap: () => _pickDate(_dateController),
          validator: (v) =>
              v == null || v.isEmpty ? 'Required' : null,
        ),
        const SizedBox(height: 12),
        DropdownButtonFormField<String>(
          initialValue: _type,
          decoration: const InputDecoration(labelText: 'Type'),
          items: ServiceType.values
              .map((t) => DropdownMenuItem(
                  value: t.name, child: Text(t.label)))
              .toList(),
          onChanged: (v) => setState(() => _type = v!),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _descriptionController,
          decoration:
              const InputDecoration(labelText: 'Description'),
          maxLines: 3,
        ),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _costController,
                decoration:
                    const InputDecoration(labelText: 'Cost (\u00A3)'),
                keyboardType: TextInputType.number,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: TextFormField(
                controller: _mileageController,
                decoration:
                    const InputDecoration(labelText: 'Mileage'),
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _garageController,
          decoration: const InputDecoration(labelText: 'Garage'),
        ),

        const SizedBox(height: 16),
        const SectionHeader(
            title: 'Next Service',
            icon: Icons.event_repeat_rounded),
        const SizedBox(height: 8),
        TextFormField(
          controller: _nextServiceDateController,
          decoration: InputDecoration(
            labelText: 'Next Service Date',
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today_rounded,
                  color: AppColors.primary),
              onPressed: () =>
                  _pickDate(_nextServiceDateController),
            ),
          ),
          readOnly: true,
          onTap: () => _pickDate(_nextServiceDateController),
        ),
        const SizedBox(height: 12),
        TextFormField(
          controller: _nextServiceMileageController,
          decoration: const InputDecoration(
              labelText: 'Next Service Mileage'),
          keyboardType: TextInputType.number,
        ),

        if (isExistingEntry)
          DocumentAttachments(
            parentType: 'service',
            parentId: widget.editEntryId!,
          ),

        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: _save,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(isExistingEntry ? 'Save Changes' : 'Add Entry'),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

}
