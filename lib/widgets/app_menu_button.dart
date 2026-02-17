import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/theme/app_colors.dart';

enum _MenuRoute {
  profile('/profile', 'Driver Profile', Icons.person_rounded),
  settings('/settings', 'Settings & Tools', Icons.settings_rounded),
  about('/about', 'About', Icons.info_outline_rounded);

  const _MenuRoute(this.path, this.label, this.icon);
  final String path;
  final String label;
  final IconData icon;
}

class AppMenuButton extends StatelessWidget {
  const AppMenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();

    return PopupMenuButton<_MenuRoute>(
      icon: const Icon(Icons.menu_rounded, color: Colors.white, size: 28),
      offset: const Offset(0, 48),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      onSelected: (route) => context.go(route.path),
      itemBuilder: (_) => _MenuRoute.values.map((route) {
        final isCurrent = _isCurrentRoute(location, route.path);
        return PopupMenuItem<_MenuRoute>(
          value: route,
          child: Row(
            children: [
              Icon(
                route.icon,
                size: 20,
                color: isCurrent ? AppColors.primary : AppColors.textSecondary,
              ),
              const SizedBox(width: 12),
              Text(
                route.label,
                style: TextStyle(
                  color:
                      isCurrent ? AppColors.primary : AppColors.textPrimary,
                  fontWeight: isCurrent ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  bool _isCurrentRoute(String location, String path) {
    if (path == '/') return location == '/';
    return location.startsWith(path);
  }
}
