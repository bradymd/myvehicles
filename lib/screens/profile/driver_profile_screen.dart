import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/models/driver_profile.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/empty_state.dart';

class DriverProfileScreen extends ConsumerWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(profilesProvider);

    return AppScaffold(
      title: 'Driver Profiles',
      centerTitle: true,
      showBackButton: false,
      body: profilesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
        data: (profiles) {
          if (profiles.isEmpty) {
            return EmptyState(
              message: 'No driver profiles',
              subtitle:
                  'Add your details for emergency screens and roadside stops',
              actionLabel: 'Add Profile',
              onAction: () => context.push('/edit-profile'),
            );
          }

          return Stack(
            children: [
              ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: profiles.length,
                itemBuilder: (context, index) =>
                    _ProfileCard(profile: profiles[index]),
              ),
              Positioned(
                bottom: 24,
                right: 24,
                child: FloatingActionButton(
                  onPressed: () => context.push('/edit-profile'),
                  backgroundColor: AppColors.primary,
                  child: const Icon(Icons.add, color: Colors.white),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ProfileCard extends StatelessWidget {
  const _ProfileCard({required this.profile});
  final DriverProfile profile;

  @override
  Widget build(BuildContext context) {
    // Licence expiry colour coding
    Color? expiryColor;
    String expiryText = '';
    if (profile.licenceExpiry.isNotEmpty) {
      final days = daysUntil(profile.licenceExpiry);
      expiryText = formatDateUK(profile.licenceExpiry);
      if (days < 0) {
        expiryColor = AppColors.danger;
      } else if (days <= 120) {
        expiryColor = AppColors.warning;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () => context.push('/profile/${profile.id}'),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Avatar
              CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.primary.withValues(alpha: 0.1),
                child: Text(
                  profile.name.isNotEmpty
                      ? profile.name[0].toUpperCase()
                      : '?',
                  style: AppTextStyles.heading.copyWith(
                    color: AppColors.primary,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      profile.name.isNotEmpty ? profile.name : 'Unnamed',
                      style: AppTextStyles.bodyBold,
                    ),
                    if (profile.licenceNumber.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Text(
                        'Licence: ${profile.licenceNumber}',
                        style: AppTextStyles.caption,
                      ),
                    ],
                    if (expiryText.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'Expires: $expiryText',
                        style: AppTextStyles.caption.copyWith(
                          color: expiryColor,
                          fontWeight:
                              expiryColor != null ? FontWeight.w600 : null,
                        ),
                      ),
                    ],
                    if (profile.emergencyContactName.isNotEmpty) ...[
                      const SizedBox(height: 2),
                      Text(
                        'ICE: ${profile.emergencyContactName}',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ],
                ),
              ),
              const Icon(Icons.chevron_right_rounded,
                  color: AppColors.textMuted),
            ],
          ),
        ),
      ),
    );
  }
}
