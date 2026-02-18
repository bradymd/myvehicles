import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';

class CarTaxInfoScreen extends ConsumerStatefulWidget {
  const CarTaxInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<CarTaxInfoScreen> createState() => _CarTaxInfoScreenState();
}

class _CarTaxInfoScreenState extends ConsumerState<CarTaxInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _taxDueDateCtrl;

  @override
  void initState() {
    super.initState();
    _taxDueDateCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _taxDueDateCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _taxDueDateCtrl.text = vehicle.taxDueDate;
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    final updated = vehicle.copyWith(
      taxDueDate: _taxDueDateCtrl.text.trim(),
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

        final isLeased = vehicle.ownership == 'leased' ||
            vehicle.ownership == 'pch';

        return AppScaffold(
          title: _isEditing ? 'Editing Car Tax' : 'Car Tax',
          useOverlayNav: true,
          showBackButton: true,
          onBack: _isEditing ? _cancel : null,
          overlayFabIcon: isLeased
              ? null
              : _isEditing
                  ? Icons.check_rounded
                  : Icons.edit_rounded,
          overlayFabOnPressed: isLeased
              ? null
              : _isEditing
                  ? _save
                  : () => _startEditing(vehicle),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                isLeased
                    ? _buildLeasedNotice(vehicle)
                    : _isEditing
                        ? _buildForm()
                        : _buildDisplay(vehicle),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildLeasedNotice(Vehicle vehicle) {
    final reg = vehicle.registration.toUpperCase();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.softOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                decoration: BoxDecoration(
                  color: const Color(0xFFFDD835),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: Colors.black87, width: 1.5),
                ),
                child: Text(
                  reg.isNotEmpty ? reg : 'Vehicle',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w900,
                    color: Colors.black87,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'is a Leased Vehicle',
                style: AppTextStyles.subheading,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Car Tax is dealt with by the lease provider',
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        DocumentAttachments(
          parentType: 'car_tax',
          parentId: widget.vehicleId,
        ),
      ],
    );
  }

  Widget _buildDisplay(Vehicle vehicle) {
    final dateStr = vehicle.taxDueDate;
    final days = daysUntil(dateStr);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _infoRow('Tax Due Date', dateStr.isNotEmpty ? formatDateUK(dateStr) : ''),
        if (dateStr.isNotEmpty) ...[
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: days < 0
                  ? AppColors.softRed
                  : days <= 30
                      ? AppColors.softOrange
                      : AppColors.softGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  days < 0
                      ? Icons.error_rounded
                      : days <= 30
                          ? Icons.warning_amber_rounded
                          : Icons.check_circle_rounded,
                  color: days < 0
                      ? AppColors.danger
                      : days <= 30
                          ? AppColors.warning
                          : AppColors.success,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    days < 0
                        ? 'Tax expired ${-days} days ago'
                        : 'Tax due ${formatDateRelative(dateStr)}',
                    style: AppTextStyles.bodyBold.copyWith(
                      color: days < 0
                          ? AppColors.danger
                          : days <= 30
                              ? AppColors.warning
                              : AppColors.success,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        if (dateStr.isEmpty) ...[
          const SizedBox(height: 16),
          Text(
            'No tax due date set. Tap the edit button to add one.',
            style: AppTextStyles.caption,
          ),
        ],
        DocumentAttachments(
          parentType: 'car_tax',
          parentId: widget.vehicleId,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _taxDueDateCtrl,
            decoration: InputDecoration(
              labelText: 'Tax Due Date',
              suffixIcon: IconButton(
                icon: const Icon(Icons.calendar_today_rounded),
                onPressed: () => _pickDate(_taxDueDateCtrl),
              ),
            ),
            readOnly: true,
            onTap: () => _pickDate(_taxDueDateCtrl),
          ),
        ],
      ),
    );
  }
}
