import 'package:flutter/material.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';

/// A banner shown at the top of body content to identify
/// the page name and which vehicle it relates to.
class VehiclePageHeader extends StatelessWidget {
  const VehiclePageHeader({
    super.key,
    required this.pageTitle,
    this.registration,
    this.vehicleDescription,
  });

  final String pageTitle;
  final String? registration;
  final String? vehicleDescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(pageTitle, style: AppTextStyles.heading.copyWith(fontSize: 20)),
          if (registration != null || vehicleDescription != null) ...[
            const SizedBox(height: 2),
            Text(
              [
                if (registration != null && registration!.isNotEmpty)
                  registration!.toUpperCase(),
                if (vehicleDescription != null &&
                    vehicleDescription!.isNotEmpty)
                  vehicleDescription!,
              ].join(' \u2022 '),
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
