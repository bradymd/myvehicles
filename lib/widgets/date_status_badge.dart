import 'package:flutter/material.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

class DateStatusBadge extends StatelessWidget {
  const DateStatusBadge({
    super.key,
    required this.label,
    required this.dateStr,
    this.compact = false,
  });

  final String label;
  final String dateStr;
  final bool compact;

  @override
  Widget build(BuildContext context) {
    final days = daysUntil(dateStr);
    final Color bgColor;
    final Color textColor;

    if (dateStr.isEmpty) {
      bgColor = Colors.grey.shade100;
      textColor = AppColors.textMuted;
    } else if (days < 0) {
      bgColor = AppColors.softRed;
      textColor = AppColors.danger;
    } else if (days <= 7) {
      bgColor = AppColors.softRed;
      textColor = AppColors.danger;
    } else if (days <= 30) {
      bgColor = AppColors.softOrange;
      textColor = AppColors.warning;
    } else {
      bgColor = AppColors.softGreen;
      textColor = AppColors.success;
    }

    if (compact) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          dateStr.isEmpty ? '$label: Not set' : '$label: ${formatDateRelative(dateStr)}',
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: textColor,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor.withValues(alpha: 0.7),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            dateStr.isEmpty ? 'Not set' : formatDateUK(dateStr),
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: textColor,
            ),
          ),
          if (dateStr.isNotEmpty)
            Text(
              formatDateRelative(dateStr),
              style: TextStyle(
                fontSize: 11,
                color: textColor.withValues(alpha: 0.7),
              ),
            ),
        ],
      ),
    );
  }
}
