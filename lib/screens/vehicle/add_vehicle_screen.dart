import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_vehicles/constants/enums.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/services/file_attributes_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/id_generator.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class AddVehicleScreen extends ConsumerStatefulWidget {
  const AddVehicleScreen({super.key, this.editVehicleId});

  final String? editVehicleId;

  @override
  ConsumerState<AddVehicleScreen> createState() => _AddVehicleScreenState();
}

class _AddVehicleScreenState extends ConsumerState<AddVehicleScreen> {
  final _formKey = GlobalKey<FormState>();

  final _registrationController = TextEditingController();
  final _makeController = TextEditingController();
  final _modelController = TextEditingController();
  final _yearController = TextEditingController();
  final _colourController = TextEditingController();
  String _fuelType = 'petrol';
  String _transmission = '';
  final _mileageController = TextEditingController();
  String _photoPath = '';

  // Keep existing data when editing so we don't lose other fields
  Vehicle? _existingVehicle;

  bool get isEditing => widget.editVehicleId != null;

  @override
  void initState() {
    super.initState();
    if (isEditing) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _loadVehicle());
    }
  }

  void _loadVehicle() {
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final v =
        vehicles.where((v) => v.id == widget.editVehicleId).firstOrNull;
    if (v == null) return;

    _existingVehicle = v;
    _registrationController.text = v.registration;
    _makeController.text = v.make;
    _modelController.text = v.model;
    _yearController.text = v.year;
    _colourController.text = v.colour;
    _fuelType = v.fuelType;
    _transmission = v.transmission;
    _mileageController.text =
        v.currentMileage > 0 ? v.currentMileage.toString() : '';
    _photoPath = v.photoPath;
    setState(() {});
  }

  @override
  void dispose() {
    _registrationController.dispose();
    _makeController.dispose();
    _modelController.dispose();
    _yearController.dispose();
    _colourController.dispose();
    _mileageController.dispose();
    super.dispose();
  }

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
      // Mark directory for iOS backup to ensure it persists through app updates
      await FileAttributesService.markDirectoryForBackup(photosDir.path);
    }
    final ext = p.extension(picked.path);
    final filename =
        'vehicle_${widget.editVehicleId ?? generateId()}$ext';
    final destPath = p.join(photosDir.path, filename);
    await File(picked.path).copy(destPath);

    setState(() => _photoPath = destPath);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    // Merge with existing vehicle data to preserve other fields
    final base = _existingVehicle ??
        Vehicle(id: widget.editVehicleId ?? generateId());

    final vehicle = base.copyWith(
      registration: _registrationController.text.trim(),
      make: _makeController.text.trim(),
      model: _modelController.text.trim(),
      year: _yearController.text.trim(),
      colour: _colourController.text.trim(),
      fuelType: _fuelType,
      transmission: _transmission,
      currentMileage: int.tryParse(_mileageController.text.trim()) ?? 0,
      photoPath: _photoPath,
    );

    if (isEditing) {
      await ref.read(vehiclesProvider.notifier).updateVehicle(vehicle);
    } else {
      await ref.read(vehiclesProvider.notifier).addVehicle(vehicle);
    }

    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: isEditing ? 'Edit Vehicle' : 'Add Vehicle',
      useOverlayNav: true,
      showBackButton: true,
      showMenuButton: false,
      overlayFabIcon: Icons.check_rounded,
      overlayFabOnPressed: () {
        if (_formKey.currentState!.validate()) _save();
      },
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                  child: _photoPath.isNotEmpty &&
                          File(_photoPath).existsSync()
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
                                            color: Colors.white,
                                            fontSize: 12)),
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
                                color: AppColors.primary
                                    .withValues(alpha: 0.4)),
                            const SizedBox(height: 8),
                            Text(
                              'Add a photo of your car',
                              style: AppTextStyles.caption.copyWith(
                                color: AppColors.primary
                                    .withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                ),
              ),

              // Registration
              TextFormField(
                controller: _registrationController,
                decoration: const InputDecoration(labelText: 'Registration'),
                textCapitalization: TextCapitalization.characters,
              ),
              const SizedBox(height: 12),

              // Make + Model
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _makeController,
                      decoration: const InputDecoration(labelText: 'Make'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Required' : null,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _modelController,
                      decoration: const InputDecoration(labelText: 'Model'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Year + Colour
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _yearController,
                      decoration: const InputDecoration(labelText: 'Year'),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: TextFormField(
                      controller: _colourController,
                      decoration: const InputDecoration(labelText: 'Colour'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // Fuel Type + Transmission
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
                      initialValue: _transmission.isEmpty ? null : _transmission,
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

              // Mileage
              TextFormField(
                controller: _mileageController,
                decoration:
                    const InputDecoration(labelText: 'Current Mileage'),
                keyboardType: TextInputType.number,
              ),

              // Save button
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: Text(isEditing ? 'Save Changes' : 'Add Vehicle'),
                ),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
