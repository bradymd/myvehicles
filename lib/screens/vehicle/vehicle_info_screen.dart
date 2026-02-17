import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/models/document_ref.dart';
import 'package:my_vehicles/providers/document_provider.dart';
import 'package:my_vehicles/providers/mot_provider.dart';
import 'package:my_vehicles/providers/service_provider.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/section_header.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class VehicleInfoScreen extends ConsumerStatefulWidget {
  const VehicleInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<VehicleInfoScreen> createState() => _VehicleInfoScreenState();
}

class _VehicleInfoScreenState extends ConsumerState<VehicleInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _registrationCtrl;
  late TextEditingController _makeCtrl;
  late TextEditingController _modelCtrl;
  late TextEditingController _yearCtrl;
  late TextEditingController _colourCtrl;
  late TextEditingController _mileageCtrl;
  late TextEditingController _vinCtrl;
  late TextEditingController _variantCtrl;
  late TextEditingController _bodyTypeCtrl;
  late TextEditingController _engineCCCtrl;
  late TextEditingController _engineNumberCtrl;
  late TextEditingController _keyNumberCtrl;
  late TextEditingController _chassisNumberCtrl;
  late TextEditingController _radioCodeCtrl;
  late TextEditingController _descriptionCtrl;
  String _fuelType = 'petrol';
  String _transmission = '';
  String _photoPath = '';

  @override
  void initState() {
    super.initState();
    _registrationCtrl = TextEditingController();
    _makeCtrl = TextEditingController();
    _modelCtrl = TextEditingController();
    _yearCtrl = TextEditingController();
    _colourCtrl = TextEditingController();
    _mileageCtrl = TextEditingController();
    _vinCtrl = TextEditingController();
    _variantCtrl = TextEditingController();
    _bodyTypeCtrl = TextEditingController();
    _engineCCCtrl = TextEditingController();
    _engineNumberCtrl = TextEditingController();
    _keyNumberCtrl = TextEditingController();
    _chassisNumberCtrl = TextEditingController();
    _radioCodeCtrl = TextEditingController();
    _descriptionCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _registrationCtrl.dispose();
    _makeCtrl.dispose();
    _modelCtrl.dispose();
    _yearCtrl.dispose();
    _colourCtrl.dispose();
    _mileageCtrl.dispose();
    _vinCtrl.dispose();
    _variantCtrl.dispose();
    _bodyTypeCtrl.dispose();
    _engineCCCtrl.dispose();
    _engineNumberCtrl.dispose();
    _keyNumberCtrl.dispose();
    _chassisNumberCtrl.dispose();
    _radioCodeCtrl.dispose();
    _descriptionCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _registrationCtrl.text = vehicle.registration;
    _makeCtrl.text = vehicle.make;
    _modelCtrl.text = vehicle.model;
    _yearCtrl.text = vehicle.year;
    _colourCtrl.text = vehicle.colour;
    _mileageCtrl.text =
        vehicle.currentMileage > 0 ? vehicle.currentMileage.toString() : '';
    _vinCtrl.text = vehicle.vin;
    _variantCtrl.text = vehicle.variant;
    _bodyTypeCtrl.text = vehicle.bodyType;
    _engineCCCtrl.text = vehicle.engineCC;
    _engineNumberCtrl.text = vehicle.engineNumber;
    _keyNumberCtrl.text = vehicle.keyNumber;
    _chassisNumberCtrl.text = vehicle.chassisNumber;
    _radioCodeCtrl.text = vehicle.radioCode;
    _descriptionCtrl.text = vehicle.description;
    _fuelType = vehicle.fuelType;
    _transmission = vehicle.transmission;
    _photoPath = vehicle.photoPath;
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    final updated = vehicle.copyWith(
      registration: _registrationCtrl.text.trim(),
      make: _makeCtrl.text.trim(),
      model: _modelCtrl.text.trim(),
      year: _yearCtrl.text.trim(),
      colour: _colourCtrl.text.trim(),
      fuelType: _fuelType,
      transmission: _transmission,
      currentMileage: int.tryParse(_mileageCtrl.text.trim()) ?? 0,
      vin: _vinCtrl.text.trim(),
      variant: _variantCtrl.text.trim(),
      bodyType: _bodyTypeCtrl.text.trim(),
      engineCC: _engineCCCtrl.text.trim(),
      engineNumber: _engineNumberCtrl.text.trim(),
      keyNumber: _keyNumberCtrl.text.trim(),
      chassisNumber: _chassisNumberCtrl.text.trim(),
      radioCode: _radioCodeCtrl.text.trim(),
      description: _descriptionCtrl.text.trim(),
      photoPath: _photoPath,
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    setState(() => _isEditing = false);
  }

  void _cancel() => setState(() => _isEditing = false);

  void _showPhotoOptions() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 16),
              Text('Vehicle Photo', style: AppTextStyles.subheading),
              const SizedBox(height: 16),
              ListTile(
                leading: const Icon(Icons.camera_alt_rounded,
                    color: AppColors.primary),
                title: const Text('Take a Photo'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickPhoto(ImageSource.camera);
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_library_rounded,
                    color: AppColors.primary),
                title: const Text('Choose from Gallery'),
                onTap: () {
                  Navigator.pop(ctx);
                  _pickPhoto(ImageSource.gallery);
                },
              ),
              if (_photoPath.isNotEmpty) ...[
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.delete_outline_rounded,
                      color: AppColors.danger),
                  title: const Text('Remove Photo'),
                  onTap: () {
                    Navigator.pop(ctx);
                    setState(() => _photoPath = '');
                  },
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      maxWidth: 1200,
      maxHeight: 1200,
      imageQuality: 85,
    );
    if (picked == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory(p.join(appDir.path, 'vehicle_photos'));
    if (!photosDir.existsSync()) {
      photosDir.createSync(recursive: true);
    }
    final ext = p.extension(picked.path);
    final filename = 'vehicle_${widget.vehicleId}$ext';
    final destPath = p.join(photosDir.path, filename);
    await File(picked.path).copy(destPath);

    setState(() => _photoPath = destPath);
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
                    icon:
                        const Icon(Icons.edit_rounded, color: Colors.white),
                    onPressed: () => _startEditing(vehicle),
                  ),
                ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _isEditing ? _buildForm() : _buildDisplay(vehicle),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(Vehicle vehicle) {
    final fuelLabel = FuelType.values
        .where((f) => f.name == vehicle.fuelType)
        .firstOrNull
        ?.label ?? vehicle.fuelType;
    final transLabel = TransmissionType.values
        .where((t) => t.name == vehicle.transmission)
        .firstOrNull
        ?.label ?? vehicle.transmission;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Photo
        if (vehicle.photoPath.isNotEmpty &&
            File(vehicle.photoPath).existsSync())
          Container(
            height: 200,
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 16),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.file(
              File(vehicle.photoPath),
              fit: BoxFit.cover,
            ),
          ),

        const SectionHeader(
            title: 'Vehicle Details', icon: Icons.directions_car_rounded),
        _infoRow('Description', vehicle.description),
        _infoRow('Registration', vehicle.registration.toUpperCase()),
        _infoRow('Make', vehicle.make),
        _infoRow('Model', vehicle.model),
        _infoRow('Variant', vehicle.variant),
        _infoRow('Year', vehicle.year),
        _infoRow('Colour', vehicle.colour),
        _infoRow('Body Type', vehicle.bodyType),
        _infoRow('Fuel Type', fuelLabel),
        _infoRow('Transmission', transLabel),
        _infoRow('Engine CC', vehicle.engineCC),
        _infoRow(
          'Mileage',
          vehicle.currentMileage > 0
              ? '${vehicle.currentMileage}'
              : '',
        ),
        _infoRow('VIN', vehicle.vin),
        _infoRow('Chassis No.', vehicle.chassisNumber),
        _infoRow('Engine No.', vehicle.engineNumber),
        _infoRow('Key No.', vehicle.keyNumber),
        _infoRow('Radio Code', vehicle.radioCode),
        _AllDocumentsReadOnly(vehicleId: widget.vehicleId),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Photo picker
          GestureDetector(
            onTap: _showPhotoOptions,
            child: Container(
              height: 160,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.2),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: _photoPath.isNotEmpty && File(_photoPath).existsSync()
                  ? Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.file(File(_photoPath), fit: BoxFit.cover),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(Icons.camera_alt_rounded,
                                    color: Colors.white, size: 16),
                                SizedBox(width: 4),
                                Text('Change',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add_a_photo_rounded,
                            size: 36,
                            color:
                                AppColors.primary.withValues(alpha: 0.4)),
                        const SizedBox(height: 8),
                        Text(
                          'Add a photo of your car',
                          style: AppTextStyles.caption.copyWith(
                            color:
                                AppColors.primary.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
            ),
          ),

          const SectionHeader(
              title: 'Vehicle Details', icon: Icons.directions_car_rounded),
          const SizedBox(height: 8),
          TextFormField(
            controller: _descriptionCtrl,
            decoration: const InputDecoration(
              labelText: 'Description',
              hintText: 'e.g. Citroen 1.2 PureTech C-Series 5dr Auto 2022',
            ),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _registrationCtrl,
            decoration: const InputDecoration(labelText: 'Registration'),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _makeCtrl,
                  decoration: const InputDecoration(labelText: 'Make'),
                  validator: (v) =>
                      v == null || v.isEmpty ? 'Required' : null,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _modelCtrl,
                  decoration: const InputDecoration(labelText: 'Model'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _yearCtrl,
                  decoration: const InputDecoration(labelText: 'Year'),
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _colourCtrl,
                  decoration: const InputDecoration(labelText: 'Colour'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue: _fuelType,
                  decoration:
                      const InputDecoration(labelText: 'Fuel Type'),
                  items: FuelType.values
                      .map((f) => DropdownMenuItem(
                          value: f.name, child: Text(f.label)))
                      .toList(),
                  onChanged: (v) => setState(() => _fuelType = v!),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: DropdownButtonFormField<String>(
                  initialValue:
                      _transmission.isEmpty ? null : _transmission,
                  decoration:
                      const InputDecoration(labelText: 'Transmission'),
                  items: TransmissionType.values
                      .map((t) => DropdownMenuItem(
                          value: t.name, child: Text(t.label)))
                      .toList(),
                  onChanged: (v) =>
                      setState(() => _transmission = v ?? ''),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _variantCtrl,
            decoration: const InputDecoration(labelText: 'Variant / Trim'),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _bodyTypeCtrl,
                  decoration: const InputDecoration(labelText: 'Body Type'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _engineCCCtrl,
                  decoration: const InputDecoration(labelText: 'Engine CC'),
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _mileageCtrl,
            decoration:
                const InputDecoration(labelText: 'Current Mileage'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _vinCtrl,
            decoration: const InputDecoration(labelText: 'VIN'),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _chassisNumberCtrl,
            decoration: const InputDecoration(labelText: 'Chassis No.'),
            textCapitalization: TextCapitalization.characters,
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _engineNumberCtrl,
                  decoration: const InputDecoration(labelText: 'Engine No.'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextFormField(
                  controller: _keyNumberCtrl,
                  decoration: const InputDecoration(labelText: 'Key No.'),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _radioCodeCtrl,
            decoration: const InputDecoration(labelText: 'Radio Code'),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Read-only list of ALL documents across all panels for a vehicle.
class _AllDocumentsReadOnly extends ConsumerStatefulWidget {
  const _AllDocumentsReadOnly({required this.vehicleId});
  final String vehicleId;

  @override
  ConsumerState<_AllDocumentsReadOnly> createState() =>
      _AllDocumentsReadOnlyState();
}

class _AllDocumentsReadOnlyState extends ConsumerState<_AllDocumentsReadOnly> {
  List<DocumentRef> _docs = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _loadAllDocs();
  }

  Future<void> _loadAllDocs() async {
    // Collect all parentIds that belong to this vehicle:
    // vehicleId itself covers insurance, breakdown, recovery, purchase, car_tax, vehicle
    final parentIds = <String>[widget.vehicleId];

    // MOT record IDs
    final motRecords =
        ref.read(motRecordsProvider(widget.vehicleId)).valueOrNull ?? [];
    for (final r in motRecords) {
      parentIds.add(r.id);
    }

    // Service entry IDs
    final serviceEntries =
        ref.read(serviceEntriesProvider(widget.vehicleId)).valueOrNull ?? [];
    for (final e in serviceEntries) {
      parentIds.add(e.id);
    }

    final docs = await ref
        .read(documentsProvider.notifier)
        .getForParentIds(parentIds);

    // Deduplicate by localPath so the same file doesn't appear twice
    final seen = <String>{};
    final uniqueDocs = <DocumentRef>[];
    for (final doc in docs) {
      if (seen.add(doc.localPath)) {
        uniqueDocs.add(doc);
      }
    }

    if (mounted) {
      setState(() {
        _docs = uniqueDocs;
        _loading = false;
      });
    }
  }

  String _parentLabel(DocumentRef doc) {
    return switch (doc.parentType) {
      'vehicle' => 'Vehicle',
      'insurance' => 'Insurance',
      'mot' => 'MOT',
      'service' => 'Service',
      'breakdown' => 'Breakdown',
      'recovery' => 'Accident & Recovery',
      'purchase' => 'Ownership',
      'car_tax' => 'Car Tax',
      _ => doc.parentType,
    };
  }

  IconData _iconForType(String fileType) {
    return switch (fileType) {
      'PDF' => Icons.picture_as_pdf_rounded,
      'Image' => Icons.image_rounded,
      'Document' => Icons.description_rounded,
      'Spreadsheet' => Icons.table_chart_rounded,
      _ => Icons.insert_drive_file_rounded,
    };
  }

  Color _colorForType(String fileType) {
    return switch (fileType) {
      'PDF' => const Color(0xFFE53935),
      'Image' => const Color(0xFF43A047),
      'Document' => const Color(0xFF1E88E5),
      'Spreadsheet' => const Color(0xFF2E7D32),
      _ => AppColors.textMuted,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Row(
          children: [
            Icon(Icons.attach_file_rounded,
                size: 18, color: AppColors.textSecondary),
            const SizedBox(width: 6),
            Text('All Documents', style: AppTextStyles.label),
          ],
        ),
        const SizedBox(height: 8),
        if (_loading)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          )
        else if (_docs.isEmpty)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.softPurple,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(Icons.folder_open_rounded,
                    size: 32, color: AppColors.textMuted),
                const SizedBox(height: 8),
                Text('No documents yet', style: AppTextStyles.caption),
                const SizedBox(height: 4),
                Text(
                  'Add documents from the relevant panels',
                  style: AppTextStyles.caption
                      .copyWith(fontSize: 11, color: AppColors.textMuted),
                ),
              ],
            ),
          )
        else
          ...List.generate(_docs.length, (i) {
            final doc = _docs[i];
            final fileExists =
                doc.localPath.isNotEmpty && File(doc.localPath).existsSync();

            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color:
                        _colorForType(doc.fileType).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _iconForType(doc.fileType),
                    color: _colorForType(doc.fileType),
                    size: 22,
                  ),
                ),
                title: Text(
                  doc.filename,
                  style: AppTextStyles.body,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  _parentLabel(doc),
                  style: AppTextStyles.caption.copyWith(
                    fontSize: 11,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                trailing: fileExists
                    ? Icon(Icons.open_in_new_rounded,
                        size: 18, color: AppColors.textMuted)
                    : null,
                onTap: fileExists
                    ? () => DocumentService.openFile(doc.localPath)
                    : null,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
              ),
            );
          }),
      ],
    );
  }
}
