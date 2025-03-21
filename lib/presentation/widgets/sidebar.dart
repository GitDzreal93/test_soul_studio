import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';

class SideBarItem {
  final IconData icon;
  final String label;
  final String route;

  const SideBarItem({
    required this.icon,
    required this.label,
    required this.route,
  });
}

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool _isExpanded = false;
  int _selectedIndex = 0;

  final List<SideBarItem> _items = const [
    SideBarItem(
      icon: Icons.home,
      label: '首页',
      route: '/',
    ),
    SideBarItem(
      icon: Icons.list,
      label: '列表页',
      route: '/list',
    ),
    SideBarItem(
      icon: Icons.build,
      label: '工具导航',
      route: '/tools',
    ),
    SideBarItem(
      icon: Icons.swap_horiz,
      label: '文件传输',
      route: '/file-transfer',
    ),
    SideBarItem(
      icon: Icons.terminal,
      label: 'ADB控制台',
      route: '/adb-console',
    ),
    SideBarItem(
      icon: Icons.settings,
      label: '设置',
      route: '/settings',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isExpanded = true),
      onExit: (_) => setState(() => _isExpanded = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: _isExpanded ? 200 : 64,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1A202C), Color(0xFF2D3748)],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: const Offset(2, 0),
            ),
          ],
        ),
        child: Column(
          children: [
            const SizedBox(height: 16),
            ..._items.asMap().entries.map((entry) {
              final index = entry.key;
              final item = entry.value;
              return _buildMenuItem(item, index);
            }),
            const Spacer(),
            _buildThemeToggle(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(SideBarItem item, int index) {
    final isSelected = index == _selectedIndex;
    return InkWell(
      onTap: () {
        setState(() => _selectedIndex = index);
        Navigator.pushNamed(context, item.route);
      },
      child: Container(
        height: 56,
        color: isSelected
            ? Colors.white.withOpacity(0.1)
            : Colors.transparent,
        child: Row(
          children: [
            SizedBox(
              width: 64,
              child: Icon(
                item.icon,
                color: isSelected ? Colors.white : Colors.white70,
                size: 24,
              ),
            ),
            if (_isExpanded)
              Expanded(
                child: Text(
                  item.label,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildThemeToggle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.dark_mode,
            color: Colors.white70,
            size: 24,
          ),
          if (_isExpanded) ...[
            const SizedBox(width: 16),
            Text(
              '深色模式',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ],
        ],
      ),
    );
  }
} 