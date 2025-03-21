import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_soul_app/config/routes.dart';
import 'package:test_soul_app/config/themes.dart';
import 'package:test_soul_app/providers/theme_provider.dart';

class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<SideBar> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> with RouteAware {
  static bool _isExpandedStatic = false;  // 使用静态变量保存展开状态
  String _currentRoute = '/';

  final List<_SideBarItem> _items = [
    _SideBarItem(
      icon: Icons.home_outlined,
      selectedIcon: Icons.home,
      label: '首页',
      route: Routes.home,
    ),
    _SideBarItem(
      icon: Icons.list_outlined,
      selectedIcon: Icons.list,
      label: '列表页',
      route: Routes.list,
    ),
    _SideBarItem(
      icon: Icons.build_outlined,
      selectedIcon: Icons.build,
      label: '工具导航',
      route: Routes.tools,
    ),
    _SideBarItem(
      icon: Icons.sync_alt_outlined,
      selectedIcon: Icons.sync_alt,
      label: '文件传输',
      route: Routes.transfer,
    ),
    _SideBarItem(
      icon: Icons.terminal_outlined,
      selectedIcon: Icons.terminal,
      label: 'ADB控制台',
      route: Routes.console,
    ),
    _SideBarItem(
      icon: Icons.settings_outlined,
      selectedIcon: Icons.settings,
      label: '设置',
      route: Routes.settings,
    ),
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _currentRoute = ModalRoute.of(context)?.settings.name ?? Routes.home;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(themeProvider) == ThemeMode.dark;

    return Stack(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOutQuart,
          width: _isExpandedStatic ? 180.w : 60.w,
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            children: [
              SizedBox(height: 12.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    final item = _items[index];
                    final isSelected = item.route == _currentRoute;
                    return _buildMenuItem(item, isSelected, theme);
                  },
                ),
              ),
              _buildThemeToggle(isDarkMode, theme),
            ],
          ),
        ),
        Positioned(
          top: 0,
          bottom: 0,
          right: -16.w,
          child: Center(
            child: Container(
              width: 32.w,
              height: 32.w,
              decoration: BoxDecoration(
                color: AppTheme.primaryColor,
                border: Border.all(
                  color: AppTheme.primaryDarkColor,
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(4.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4.r),
                  onTap: () {
                    setState(() {
                      _isExpandedStatic = !_isExpandedStatic;
                    });
                  },
                  child: Icon(
                    _isExpandedStatic ? Icons.chevron_left : Icons.chevron_right,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem(_SideBarItem item, bool isSelected, ThemeData theme) {
    return InkWell(
      onTap: () {
        if (item.route != _currentRoute) {
          setState(() {
            _currentRoute = item.route;
          });
          Navigator.pushReplacementNamed(context, item.route);
        }
      },
      child: Container(
        height: 44.h,
        margin: EdgeInsets.symmetric(
          horizontal: 8.w,
          vertical: 4.h,
        ),
        decoration: BoxDecoration(
          color: isSelected
              ? theme.colorScheme.primary.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(6.r),
        ),
        child: Row(
          children: [
            SizedBox(width: 16.w),
            Icon(
              isSelected ? item.selectedIcon : item.icon,
              color: isSelected
                  ? theme.colorScheme.primary
                  : theme.colorScheme.onSurface.withOpacity(0.6),
              size: 20.sp,
            ),
            if (_isExpandedStatic) ...[
              SizedBox(width: 12.w),
              Text(
                item.label,
                style: TextStyle(
                  color: isSelected
                      ? theme.colorScheme.primary
                      : theme.colorScheme.onSurface.withOpacity(0.6),
                  fontSize: 14.sp,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle(bool isDarkMode, ThemeData theme) {
    return Container(
      height: 44.h,
      margin: EdgeInsets.all(8.w),
      child: IconButton(
        icon: Icon(
          isDarkMode ? Icons.light_mode : Icons.dark_mode,
          color: theme.colorScheme.onSurface.withOpacity(0.6),
          size: 20.sp,
        ),
        onPressed: () {
          ref.read(themeProvider.notifier).toggleTheme();
        },
      ),
    );
  }
}

class _SideBarItem {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String route;

  const _SideBarItem({
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.route,
  });
} 