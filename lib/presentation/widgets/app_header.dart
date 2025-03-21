import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';

class AppHeader extends StatelessWidget {
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool showDeviceSelector;
  final Function? onBackPressed;

  const AppHeader({
    super.key,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.showDeviceSelector = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          if (showBackButton)
            IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                if (onBackPressed != null) {
                  onBackPressed!();
                } else {
                  Navigator.of(context).pop();
                }
              },
            ),
          if (title != null) ...[
            const SizedBox(width: 16),
            Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
          const Spacer(),
          if (showDeviceSelector) _buildDeviceSelector(),
          if (actions != null) ...[
            const SizedBox(width: 16),
            ...actions!,
          ],
        ],
      ),
    );
  }

  Widget _buildDeviceSelector() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.lightGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.phone_android,
            size: 20,
            color: AppTheme.primaryColor,
          ),
          const SizedBox(width: 8),
          Text(
            '选择设备',
            style: TextStyle(
              color: AppTheme.primaryColor,
              fontSize: 14,
            ),
          ),
          const SizedBox(width: 4),
          Icon(
            Icons.arrow_drop_down,
            color: AppTheme.primaryColor,
          ),
        ],
      ),
    );
  }
} 