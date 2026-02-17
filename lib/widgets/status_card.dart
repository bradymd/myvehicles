import 'package:flutter/material.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

class StatusCard extends StatelessWidget {
  const StatusCard({
    super.key,
    required this.label,
    required this.dateStr,
    this.icon,
  });

  final String label;
  final String dateStr;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final days = daysUntil(dateStr);
    final Color statusColor;
    final Color bgColor;

    if (dateStr.isEmpty) {
      statusColor = AppColors.textMuted;
      bgColor = Colors.grey.shade50;
    } else if (days < 0) {
      statusColor = AppColors.danger;
      bgColor = AppColors.softRed;
    } else if (days <= 7) {
      statusColor = AppColors.danger;
      bgColor = AppColors.softRed;
    } else if (days <= 30) {
      statusColor = AppColors.warning;
      bgColor = AppColors.softOrange;
    } else {
      statusColor = AppColors.success;
      bgColor = AppColors.softGreen;
    }

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon ?? Icons.event_rounded, color: statusColor, size: 24),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.caption.copyWith(color: statusColor),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 2),
          Text(
            dateStr.isEmpty ? '--' : formatDateRelative(dateStr),
            style: AppTextStyles.bodyBold.copyWith(
              color: statusColor,
              fontSize: 12,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
