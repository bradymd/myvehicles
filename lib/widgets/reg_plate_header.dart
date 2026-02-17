import 'package:flutter/material.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';

/// Displays a styled reg plate in the header bar with make/model/colour beneath.
/// Falls back to just make/model if no registration is set.
class RegPlateHeader extends StatelessWidget {
  const RegPlateHeader({super.key, required this.vehicle});

  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    final hasReg = vehicle.registration.isNotEmpty;
    final description = vehicle.displayDescription.isNotEmpty
        ? vehicle.displayDescription
        : vehicle.shortDescription;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasReg)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFF2D536),
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black87, width: 1.5),
            ),
            child: Text(
              vehicle.registration.toUpperCase(),
              style: AppTextStyles.registration.copyWith(fontSize: 16),
            ),
          ),
        if (description.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            description,
            style: AppTextStyles.caption.copyWith(
              color: Colors.white70,
              fontSize: 13,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
        if (!hasReg && description.isEmpty)
          Text(
            'Vehicle',
            style: AppTextStyles.heading.copyWith(color: Colors.white),
          ),
      ],
    );
  }
}
