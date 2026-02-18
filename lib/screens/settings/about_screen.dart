import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_vehicles/providers/tip_jar_provider.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/sparkle_button.dart';

class AboutScreen extends ConsumerWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tipJar = ref.watch(tipJarProvider);

    return AppScaffold(
      title: '',
      centerTitle: true,
      showBackButton: false,
      showMenuButton: true,
      body: ListView(
        padding: const EdgeInsets.all(32),
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                'assets/images/rescue-character.png',
                width: 100,
                height: 100,
                fit: BoxFit.contain,
              ),
            ),
          ),
          const SizedBox(height: 24),
          Center(child: Text('MyVehicles', style: AppTextStyles.heading)),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'Emergency-first vehicle manager',
              style: AppTextStyles.caption,
            ),
          ),
          const SizedBox(height: 4),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              final version = snapshot.data?.version ?? '...';
              final build = snapshot.data?.buildNumber ?? '';
              return Center(
                child: Text(
                  'Version $version${build.isNotEmpty ? '+$build' : ''}',
                  style: AppTextStyles.caption
                      .copyWith(color: AppColors.textMuted),
                ),
              );
            },
          ),
          const SizedBox(height: 32),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Quick access to breakdown, accident and police stop info. '
                'Plus manage MOT, service, insurance and documents for all your vehicles.',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Support page link
          Card(
            child: ListTile(
              leading: const Icon(Icons.support_rounded,
                  color: AppColors.primary),
              title: Text('MyVehicles Support Page',
                  style: AppTextStyles.bodyBold),
              subtitle: Text('Help, FAQs & bug reports',
                  style: AppTextStyles.caption),
              trailing: const Icon(Icons.open_in_new_rounded, size: 18),
              onTap: () => launchUrl(
                Uri.parse('https://bradymd.github.io/myvehicles/'),
                mode: LaunchMode.externalApplication,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),
          const SizedBox(height: 32),

          // Tip jar
          Center(
            child: Text(
              'Support Development',
              style: AppTextStyles.subheading,
            ),
          ),
          const SizedBox(height: 8),
          Center(
            child: Text(
              'If you find MyVehicles useful, consider leaving a tip to support future development.',
              style: AppTextStyles.caption,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          tipJar.when(
            data: (state) {
              if (state.lastSuccess) {
                return Card(
                  color: AppColors.softGreen,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      children: [
                        const Icon(Icons.favorite_rounded,
                            color: AppColors.success),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text('Thank you for your support!',
                              style: AppTextStyles.bodyBold),
                        ),
                      ],
                    ),
                  ),
                );
              }
              if (state.products.isEmpty) {
                return Card(
                  color: AppColors.softLilac,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'Tip jar is available on iOS and Android.',
                      style: AppTextStyles.caption,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Column(
                children: state.products.map((product) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SparkleButton(
                      label: '${product.title} — ${product.price}',
                      icon: Icons.favorite_rounded,
                      isLoading: state.isPurchasing,
                      onPressed: state.isPurchasing
                          ? null
                          : () => ref
                              .read(tipJarProvider.notifier)
                              .buy(product),
                    ),
                  );
                }).toList(),
              );
            },
            loading: () => const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            ),
            error: (_, _) => Card(
              color: AppColors.softLilac,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Tip jar is available on iOS and Android.',
                  style: AppTextStyles.caption,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
