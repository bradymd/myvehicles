import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_vehicles/models/driver_profile.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/id_generator.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';


class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key, this.profileId});
  final String? profileId;

  @override
  ConsumerState<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _licenceNumberController = TextEditingController();
  final _licenceExpiryController = TextEditingController();
  final _licenceCategoriesController = TextEditingController();
  final _addressController = TextEditingController();
  final _emergencyNameController = TextEditingController();
  final _emergencyPhoneController = TextEditingController();
  final _bloodTypeController = TextEditingController();
  final _notesController = TextEditingController();

  String? _existingId;
  String _licencePhotoFront = '';
  String _licencePhotoBack = '';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _loadProfile());
  }

  void _loadProfile() {
    final id = widget.profileId;
    if (id == null) return; // create mode

    final profiles = ref.read(profilesProvider).valueOrNull ?? [];
    final profile = profiles.where((p) => p.id == id).firstOrNull;
    if (profile == null) return;

    _existingId = profile.id;
    _nameController.text = profile.name;
    _licenceNumberController.text = profile.licenceNumber;
    _licenceExpiryController.text = profile.licenceExpiry;
    _licenceCategoriesController.text = profile.licenceCategories;
    _addressController.text = profile.address;
    _emergencyNameController.text = profile.emergencyContactName;
    _emergencyPhoneController.text = profile.emergencyContactPhone;
    _bloodTypeController.text = profile.bloodType;
    _notesController.text = profile.notes;
    _licencePhotoFront = profile.licencePhotoFront;
    _licencePhotoBack = profile.licencePhotoBack;
    setState(() {});
  }

  @override
  void dispose() {
    _nameController.dispose();
    _licenceNumberController.dispose();
    _licenceExpiryController.dispose();
    _licenceCategoriesController.dispose();
    _addressController.dispose();
    _emergencyNameController.dispose();
    _emergencyPhoneController.dispose();
    _bloodTypeController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickLicencePhoto(String side) async {
    final choice = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt_rounded),
              title: const Text('Take Photo'),
              onTap: () => Navigator.pop(ctx, 'camera'),
            ),
            ListTile(
              leading: const Icon(Icons.photo_library_rounded),
              title: const Text('Choose from Gallery'),
              onTap: () => Navigator.pop(ctx, 'gallery'),
            ),
            ListTile(
              leading: const Icon(Icons.upload_file_rounded),
              title: const Text('Upload Image File'),
              subtitle: const Text('JPG, PNG'),
              onTap: () => Navigator.pop(ctx, 'file'),
            ),
          ],
        ),
      ),
    );
    if (choice == null) return;

    String? sourcePath;
    String ext = '.jpg';

    if (choice == 'file') {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'jpeg', 'png'],
      );
      if (result == null || result.files.single.path == null) return;
      sourcePath = result.files.single.path;
      ext = '.${result.files.single.extension ?? 'jpg'}';
    } else {
      final picker = ImagePicker();
      final picked = await picker.pickImage(
        source: choice == 'camera' ? ImageSource.camera : ImageSource.gallery,
        maxWidth: 2000,
        maxHeight: 2000,
        imageQuality: 85,
      );
      if (picked == null) return;
      sourcePath = picked.path;
    }

    final saved = await DocumentService.saveFile(
      sourcePath!,
      'licence_${side}_${DateTime.now().millisecondsSinceEpoch}$ext',
    );
    setState(() {
      if (side == 'front') {
        _licencePhotoFront = saved;
      } else {
        _licencePhotoBack = saved;
      }
    });
  }

  void _removeLicencePhoto(String side) {
    setState(() {
      if (side == 'front') {
        _licencePhotoFront = '';
      } else {
        _licencePhotoBack = '';
      }
    });
  }

  Future<void> _pickDate(TextEditingController controller) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2050),
    );
    if (picked != null) {
      controller.text =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
    }
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;

    final profile = DriverProfile(
      id: _existingId ?? generateId(),
      name: _nameController.text.trim(),
      licenceNumber: _licenceNumberController.text.trim(),
      licenceExpiry: _licenceExpiryController.text.trim(),
      licenceCategories: _licenceCategoriesController.text.trim(),
      address: _addressController.text.trim(),
      emergencyContactName: _emergencyNameController.text.trim(),
      emergencyContactPhone: _emergencyPhoneController.text.trim(),
      bloodType: _bloodTypeController.text.trim(),
      licencePhotoFront: _licencePhotoFront,
      licencePhotoBack: _licencePhotoBack,
      notes: _notesController.text.trim(),
    );

    await ref.read(profilesProvider.notifier).saveProfile(profile);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: widget.profileId != null ? 'Edit Profile' : 'Add Profile',
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
              const SizedBox(height: 8),
              Text('Personal', style: AppTextStyles.subheading),
              const SizedBox(height: 8),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(labelText: 'Full Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(labelText: 'Address'),
                maxLines: 3,
              ),

              const SizedBox(height: 16),
              Text('Driving Licence', style: AppTextStyles.subheading),
              const SizedBox(height: 8),
              TextFormField(
                controller: _licenceNumberController,
                decoration:
                    const InputDecoration(labelText: 'Licence Number'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _licenceExpiryController,
                decoration: InputDecoration(
                  labelText: 'Licence Expiry',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today_rounded,
                        color: AppColors.primary),
                    onPressed: () =>
                        _pickDate(_licenceExpiryController),
                  ),
                ),
                readOnly: true,
                onTap: () => _pickDate(_licenceExpiryController),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _licenceCategoriesController,
                decoration: const InputDecoration(
                    labelText: 'Licence Categories (e.g. B, BE)'),
              ),
              const SizedBox(height: 16),
              Text('Licence Photos',
                  style: AppTextStyles.caption
                      .copyWith(fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: _LicencePhotoSlot(
                      label: 'Front',
                      path: _licencePhotoFront,
                      onTap: () => _pickLicencePhoto('front'),
                      onRemove: () => _removeLicencePhoto('front'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _LicencePhotoSlot(
                      label: 'Back',
                      path: _licencePhotoBack,
                      onTap: () => _pickLicencePhoto('back'),
                      onRemove: () => _removeLicencePhoto('back'),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
              Text('Emergency Contact', style: AppTextStyles.subheading),
              const SizedBox(height: 8),
              TextFormField(
                controller: _emergencyNameController,
                decoration: const InputDecoration(labelText: 'Name'),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _emergencyPhoneController,
                decoration:
                    const InputDecoration(labelText: 'Phone Number'),
                keyboardType: TextInputType.phone,
              ),

              const SizedBox(height: 16),
              Text('Medical', style: AppTextStyles.subheading),
              const SizedBox(height: 8),
              TextFormField(
                controller: _bloodTypeController,
                decoration: const InputDecoration(
                    labelText: 'Blood Type (e.g. A+, O-)'),
              ),

              const SizedBox(height: 16),
              Text('Notes', style: AppTextStyles.subheading),
              const SizedBox(height: 8),
              TextFormField(
                controller: _notesController,
                decoration: const InputDecoration(labelText: 'Notes'),
                maxLines: 4,
              ),

              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _save,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Save Profile'),
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

class _LicencePhotoSlot extends StatelessWidget {
  const _LicencePhotoSlot({
    required this.label,
    required this.path,
    required this.onTap,
    required this.onRemove,
  });

  final String label;
  final String path;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final hasPhoto = path.isNotEmpty && File(path).existsSync();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: hasPhoto ? AppColors.primary : AppColors.textMuted.withValues(alpha: 0.3),
            width: hasPhoto ? 2 : 1,
          ),
        ),
        clipBehavior: Clip.antiAlias,
        child: hasPhoto
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.file(
                    File(DocumentService.resolvePathSync(path)),
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 8),
                      color: Colors.black54,
                      child: Text(label,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                          textAlign: TextAlign.center),
                    ),
                  ),
                  Positioned(
                    top: 4,
                    right: 4,
                    child: GestureDetector(
                      onTap: onRemove,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.close,
                            color: Colors.white, size: 16),
                      ),
                    ),
                  ),
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add_a_photo_rounded,
                      size: 32, color: AppColors.textMuted),
                  const SizedBox(height: 6),
                  Text(label,
                      style: AppTextStyles.caption
                          .copyWith(fontWeight: FontWeight.w600)),
                ],
              ),
      ),
    );
  }
}
