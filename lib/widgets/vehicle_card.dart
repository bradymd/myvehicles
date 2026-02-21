import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';

class VehicleCard extends StatelessWidget {
  const VehicleCard({
    super.key,
    required this.vehicle,
    this.onTap,
    this.heroTag,
  });

  final Vehicle vehicle;
  final VoidCallback? onTap;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final hasPhoto =
        vehicle.photoPath.isNotEmpty && File(vehicle.photoPath).existsSync();
    final carColor = _colorFromName(vehicle.colour);

    Widget card = Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Colour-graded accent line at top
            Container(
              height: 5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    carColor.withValues(alpha: 0.3),
                    carColor,
                    carColor,
                    carColor.withValues(alpha: 0.3),
                  ],
                  stops: const [0.0, 0.3, 0.7, 1.0],
                ),
              ),
            ),

            // Photo with gradient overlay for text
            if (hasPhoto)
              SizedBox(
                height: 180,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.file(
                      File(vehicle.photoPath),
                      fit: BoxFit.cover,
                    ),
                    // Soft gradient at bottom for readability
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 60,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.3),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            // Card content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  // Reg plate
                  _buildRegPlate(),
                  const SizedBox(width: 14),
                  // Description
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          vehicle.shortDescription,
                          style: AppTextStyles.subheading.copyWith(
                            fontSize: 17,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          _buildDescription(),
                          style: AppTextStyles.caption.copyWith(
                            fontSize: 13,
                            color: AppColors.textSecondary,
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: carColor.withValues(alpha: 0.12),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.chevron_right_rounded,
                      color: carColor == Colors.black
                          ? AppColors.textPrimary
                          : carColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    if (heroTag != null) {
      return Hero(
        tag: heroTag!,
        child: Material(
          type: MaterialType.transparency,
          child: card,
        ),
      );
    }
    return card;
  }

  String _buildDescription() {
    if (vehicle.description.isNotEmpty) return vehicle.description;
    if (vehicle.variant.isNotEmpty) {
      final parts = <String>[vehicle.variant];
      if (vehicle.year.isNotEmpty) parts.add(vehicle.year);
      return parts.join(' \u2022 ');
    }
    final parts = <String>[];
    if (vehicle.year.isNotEmpty) parts.add(vehicle.year);
    if (vehicle.colour.isNotEmpty) parts.add(vehicle.colour);
    if (parts.isEmpty) return 'Tap to view details';
    return parts.join(' \u2022 ');
  }

  Widget _buildRegPlate() {
    if (vehicle.registration.isEmpty) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: AppColors.softPurple,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: AppColors.primaryLight),
        ),
        child: Text(
          'NO REG',
          style: AppTextStyles.registration.copyWith(
            fontSize: 13,
            color: AppColors.textMuted,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF2D536),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black87, width: 1.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Text(
        vehicle.registration.toUpperCase(),
        style: AppTextStyles.registration.copyWith(fontSize: 15),
      ),
    );
  }

  /// Map a colour name string to a Flutter Color.
  static Color _colorFromName(String name) {
    return switch (name.toLowerCase().trim()) {
      'black' => Colors.black,
      'white' => Colors.white,
      'silver' || 'grey' || 'gray' => Colors.grey.shade500,
      'red' => const Color(0xFFD32F2F),
      'blue' => const Color(0xFF1976D2),
      'dark blue' || 'navy' => const Color(0xFF0D47A1),
      'light blue' => const Color(0xFF42A5F5),
      'green' => const Color(0xFF388E3C),
      'dark green' => const Color(0xFF1B5E20),
      'yellow' => const Color(0xFFF9A825),
      'orange' => const Color(0xFFE65100),
      'brown' => const Color(0xFF5D4037),
      'beige' || 'cream' => const Color(0xFFD7CCC8),
      'purple' => const Color(0xFF7B1FA2),
      'pink' => const Color(0xFFE91E63),
      'gold' => const Color(0xFFFFB300),
      'bronze' => const Color(0xFF8D6E63),
      'maroon' || 'burgundy' => const Color(0xFF880E4F),
      _ => AppColors.primary,
    };
  }
}
