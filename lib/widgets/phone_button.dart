import 'package:flutter/material.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/utils/phone_helpers.dart';

class PhoneButton extends StatelessWidget {
  const PhoneButton({
    super.key,
    required this.label,
    required this.phoneNumber,
    this.icon = Icons.phone_rounded,
    this.color = AppColors.primary,
    this.large = false,
  });

  final String label;
  final String phoneNumber;
  final IconData icon;
  final Color color;
  final bool large;

  @override
  Widget build(BuildContext context) {
    if (phoneNumber.isEmpty) return const SizedBox.shrink();

    if (large) {
      return SizedBox(
        width: double.infinity,
        child: ElevatedButton.icon(
          onPressed: () => makePhoneCall(phoneNumber),
          icon: Icon(icon, size: 28),
          label: Text(
            label,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      );
    }

    return ActionChip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      onPressed: () => makePhoneCall(phoneNumber),
      side: BorderSide(color: color.withValues(alpha: 0.3)),
      backgroundColor: color.withValues(alpha: 0.05),
    );
  }
}
