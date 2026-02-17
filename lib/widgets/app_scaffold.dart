import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/theme/app_gradients.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/widgets/app_menu_button.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.title,
    this.subtitle,
    this.titleWidget,
    required this.body,
    this.actions,
    this.floatingActionButton,
    this.showBackButton = false,
    this.onBack,
    this.headerBottom,
    this.showMenuButton = true,
    this.centerTitle = false,
    this.isHome = false,
  });

  final String title;
  final String? subtitle;
  final Widget? titleWidget;
  final Widget body;
  final List<Widget>? actions;
  final Widget? floatingActionButton;
  final bool showBackButton;
  final VoidCallback? onBack;
  final Widget? headerBottom;
  final bool showMenuButton;
  final bool centerTitle;
  final bool isHome;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: AppGradients.header,
            ),
            child: SafeArea(
              bottom: false,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 8, 8, 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        // Car icon — home button on left
                        _buildHomeIcon(context),
                        if (showBackButton && !isHome) ...[
                          const SizedBox(width: 4),
                          IconButton(
                            icon: const Icon(Icons.arrow_back_rounded,
                                color: Colors.white),
                            onPressed: onBack ??
                                () {
                                  if (GoRouter.of(context).canPop()) {
                                    context.pop();
                                  } else {
                                    context.go('/');
                                  }
                                },
                          ),
                        ],
                        const SizedBox(width: 8),
                        Expanded(
                          child: titleWidget ??
                              Row(
                                mainAxisAlignment: centerTitle
                                    ? MainAxisAlignment.center
                                    : MainAxisAlignment.start,
                                children: [
                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment: centerTitle
                                          ? CrossAxisAlignment.center
                                          : CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          title,
                                          style: AppTextStyles.heading
                                              .copyWith(color: Colors.white),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        if (subtitle != null)
                                          Text(
                                            subtitle!,
                                            style: AppTextStyles.caption
                                                .copyWith(color: Colors.white70),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Container(
                                    width: 64,
                                    height: 64,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.asset(
                                      'assets/images/car-icon.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ],
                              ),
                        ),
                        if (actions != null) ...actions!,
                        // Hamburger menu — always top right
                        if (showMenuButton) const AppMenuButton(),
                      ],
                    ),
                    if (headerBottom != null) ...[
                      const SizedBox(height: 12),
                      headerBottom!,
                    ],
                  ],
                ),
              ),
            ),
          ),
          Expanded(child: body),
        ],
      ),
      floatingActionButton: floatingActionButton,
    );
  }

  Widget _buildHomeIcon(BuildContext context) {
    if (isHome) {
      return const Icon(Icons.home_rounded, color: Colors.white, size: 28);
    }
    return IconButton(
      icon: const Icon(Icons.home_rounded, color: Colors.white, size: 28),
      onPressed: () => context.go('/'),
      tooltip: 'Home',
    );
  }
}
