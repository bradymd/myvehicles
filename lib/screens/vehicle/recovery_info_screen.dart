import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/phone_helpers.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/document_attachments.dart';
import 'package:my_vehicles/widgets/section_header.dart';

class RecoveryInfoScreen extends ConsumerStatefulWidget {
  const RecoveryInfoScreen({super.key, required this.vehicleId});

  final String vehicleId;

  @override
  ConsumerState<RecoveryInfoScreen> createState() => _RecoveryInfoScreenState();
}

class _RecoveryInfoScreenState extends ConsumerState<RecoveryInfoScreen> {
  bool _isEditing = false;
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _providerCtrl;
  late TextEditingController _arrangedViaCtrl;
  late TextEditingController _referenceCtrl;
  late TextEditingController _contactCtrl;
  late TextEditingController _notesCtrl;

  @override
  void initState() {
    super.initState();
    _providerCtrl = TextEditingController();
    _arrangedViaCtrl = TextEditingController();
    _referenceCtrl = TextEditingController();
    _contactCtrl = TextEditingController();
    _notesCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _providerCtrl.dispose();
    _arrangedViaCtrl.dispose();
    _referenceCtrl.dispose();
    _contactCtrl.dispose();
    _notesCtrl.dispose();
    super.dispose();
  }

  void _startEditing(Vehicle vehicle) {
    _providerCtrl.text = vehicle.recoveryProvider;
    _arrangedViaCtrl.text = vehicle.recoveryArrangedVia;
    _referenceCtrl.text = vehicle.recoveryReference;
    _contactCtrl.text = vehicle.recoveryContact;
    _notesCtrl.text = vehicle.recoveryNotes;
    setState(() => _isEditing = true);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    final vehicles = ref.read(vehiclesProvider).valueOrNull ?? [];
    final vehicle =
        vehicles.where((v) => v.id == widget.vehicleId).firstOrNull;
    if (vehicle == null) return;

    final updated = vehicle.copyWith(
      recoveryProvider: _providerCtrl.text.trim(),
      recoveryArrangedVia: _arrangedViaCtrl.text.trim(),
      recoveryReference: _referenceCtrl.text.trim(),
      recoveryContact: _contactCtrl.text.trim(),
      recoveryNotes: _notesCtrl.text.trim(),
    );
    await ref.read(vehiclesProvider.notifier).updateVehicle(updated);
    setState(() => _isEditing = false);
  }

  void _cancel() => setState(() => _isEditing = false);

  void _confirmCall(String number, String label) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('Call $label?'),
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
      loading: () =>
          const Scaffold(body: Center(child: CircularProgressIndicator())),
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
                    icon:
                        const Icon(Icons.edit_rounded, color: Colors.white),
                    onPressed: () => _startEditing(vehicle),
                  ),
                ],
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _isEditing ? _buildForm() : _buildDisplay(vehicle),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDisplay(Vehicle vehicle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Emergency 999 banner
        _EmergencyBanner(
          gradient: const LinearGradient(
            colors: [Color(0xFFFF1744), Color(0xFFD50000)],
          ),
          icon: Icons.emergency_rounded,
          title: 'Anyone injured?',
          subtitle: 'Call 999 immediately',
          onTap: () => _confirmCall('999', 'Emergency Services'),
        ),
        const SizedBox(height: 20),

        // Step-by-step guide
        const SectionHeader(
          title: 'What to do after an accident',
          icon: Icons.checklist_rounded,
        ),
        const SizedBox(height: 12),

        _StepCard(
          step: 1,
          color: const Color(0xFFFF1744),
          icon: Icons.warning_amber_rounded,
          title: 'Stop & Stay Safe',
          instructions: const [
            'Stop your vehicle immediately',
            'Turn on hazard warning lights',
            'If possible, move to a safe place',
            'Do NOT leave the scene',
          ],
        ),
        _StepCard(
          step: 2,
          color: const Color(0xFFFF6D00),
          icon: Icons.phone_in_talk_rounded,
          title: 'Call for Help',
          instructions: const [
            'Call 999 if anyone is injured',
            'Call police if road is blocked',
            'Call your recovery service (below)',
          ],
        ),
        _StepCard(
          step: 3,
          color: const Color(0xFF2979FF),
          icon: Icons.swap_horiz_rounded,
          title: 'Exchange Details',
          instructions: const [
            'Get the other driver\'s name & address',
            'Vehicle registration numbers',
            'Insurance company & policy number',
            'Note the date, time, and location',
          ],
        ),
        _StepCard(
          step: 4,
          color: const Color(0xFF00C853),
          icon: Icons.camera_alt_rounded,
          title: 'Gather Evidence',
          instructions: const [
            'Take photos of all vehicles & damage',
            'Photograph the scene & road layout',
            'Get details of any witnesses',
            'Note weather & road conditions',
          ],
        ),
        _StepCard(
          step: 5,
          color: const Color(0xFFAA00FF),
          icon: Icons.shield_rounded,
          title: 'Contact Your Insurer',
          instructions: const [
            'Report the accident to your insurer',
            'Do NOT admit fault at the scene',
            'Keep all receipts for expenses',
          ],
        ),

        const SizedBox(height: 24),

        // Recovery contact section
        const SectionHeader(
          title: 'Your Recovery Contact',
          icon: Icons.local_shipping_rounded,
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: AppColors.softOrange,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'If your car is not safe or roadworthy, or you feel you are '
            'not fit to drive, this is where you need your Insurance '
            'Company to arrange recovery.',
            style: AppTextStyles.body.copyWith(fontSize: 13),
          ),
        ),
        const SizedBox(height: 12),
        _infoRow('Recovery By', vehicle.recoveryProvider),
        _infoRow('Arranged Via', vehicle.recoveryArrangedVia),
        _infoRow('Reference', vehicle.recoveryReference),
        _infoRow('Contact', vehicle.recoveryContact),
        if (vehicle.recoveryNotes.isNotEmpty) ...[
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
              vehicle.recoveryNotes,
              style: AppTextStyles.body.copyWith(fontSize: 13),
            ),
          ),
        ],
        if (vehicle.recoveryContact.isNotEmpty) ...[
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () =>
                  _confirmCall(vehicle.recoveryContact, 'Recovery'),
              icon: const Icon(Icons.phone_rounded, size: 22),
              label: const Text('Call Recovery',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFE53935),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 3,
              ),
            ),
          ),
        ] else if (_hasNoRecoveryData(vehicle)) ...[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.softPurple,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                Icon(Icons.local_shipping_rounded,
                    size: 40, color: AppColors.textMuted),
                const SizedBox(height: 12),
                Text(
                  'No recovery details set',
                  style: AppTextStyles.bodyBold,
                ),
                const SizedBox(height: 4),
                Text(
                  'Tap the edit button to add your recovery service details',
                  style: AppTextStyles.caption,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],

        // Insurance — always show, tappable to go to insurance details
        const SizedBox(height: 24),
        const SectionHeader(
          title: 'Your Insurer',
          icon: Icons.shield_rounded,
        ),
        const SizedBox(height: 8),
        Card(
          child: InkWell(
            onTap: () => context.push('/insurance-info/${widget.vehicleId}'),
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1565C0).withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.shield_rounded,
                        color: Color(0xFF1565C0), size: 24),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.insurer.isNotEmpty
                              ? vehicle.insurer
                              : 'Insurance Details',
                          style: AppTextStyles.bodyBold,
                        ),
                        if (vehicle.insurancePolicyNumber.isNotEmpty)
                          Text('Policy: ${vehicle.insurancePolicyNumber}',
                              style: AppTextStyles.caption),
                        if (vehicle.insurer.isEmpty)
                          Text('Tap to view or set up your insurance',
                              style: AppTextStyles.caption),
                      ],
                    ),
                  ),
                  const Icon(Icons.chevron_right_rounded,
                      color: AppColors.textMuted),
                ],
              ),
            ),
          ),
        ),

        DocumentAttachments(
          parentType: 'recovery',
          parentId: widget.vehicleId,
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  bool _hasNoRecoveryData(Vehicle vehicle) {
    return vehicle.recoveryProvider.isEmpty &&
        vehicle.recoveryArrangedVia.isEmpty &&
        vehicle.recoveryReference.isEmpty &&
        vehicle.recoveryContact.isEmpty &&
        vehicle.recoveryNotes.isEmpty;
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeader(
              title: 'Recovery Details', icon: Icons.local_shipping_rounded),
          const SizedBox(height: 8),
          TextFormField(
            controller: _providerCtrl,
            decoration:
                const InputDecoration(labelText: 'Recovery By'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _arrangedViaCtrl,
            decoration: const InputDecoration(
                labelText: 'Arranged Via',
                hintText: 'e.g. Via Admiral Insurance'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _referenceCtrl,
            decoration: const InputDecoration(
                labelText: 'Reference',
                hintText: 'e.g. Registration or policy number'),
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _contactCtrl,
            decoration:
                const InputDecoration(labelText: 'Contact Phone'),
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 12),
          TextFormField(
            controller: _notesCtrl,
            decoration: const InputDecoration(labelText: 'Notes'),
            maxLines: 4,
          ),
        ],
      ),
    );
  }
}

/// Bright emergency banner with gradient background
class _EmergencyBanner extends StatelessWidget {
  const _EmergencyBanner({
    required this.gradient,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final LinearGradient gradient;
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      elevation: 4,
      shadowColor: const Color(0x40FF1744),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            gradient: gradient,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.25),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: Colors.white, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                        )),
                    const SizedBox(height: 2),
                    Text(subtitle,
                        style: TextStyle(
                          color: Colors.white.withValues(alpha: 0.9),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        )),
                  ],
                ),
              ),
              const Icon(Icons.phone_rounded, color: Colors.white, size: 28),
            ],
          ),
        ),
      ),
    );
  }
}

/// Numbered step card with bright accent colour
class _StepCard extends StatelessWidget {
  const _StepCard({
    required this.step,
    required this.color,
    required this.icon,
    required this.title,
    required this.instructions,
  });

  final int step;
  final Color color;
  final IconData icon;
  final String title;
  final List<String> instructions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Step number circle
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: color.withValues(alpha: 0.35),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    '$step',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(icon, color: color, size: 20),
                        const SizedBox(width: 6),
                        Text(title,
                            style: AppTextStyles.bodyBold
                                .copyWith(color: color, fontSize: 15)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    ...instructions.map((text) => Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 6),
                                child: Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: color.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(text,
                                    style: AppTextStyles.body
                                        .copyWith(fontSize: 13)),
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
