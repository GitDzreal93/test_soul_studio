import 'package:flutter/material.dart';
import 'package:test_soul_app/presentation/screens/home/home_screen.dart';
import 'package:test_soul_app/presentation/screens/list/list_screen.dart';
import 'package:test_soul_app/presentation/screens/tools/tools_screen.dart';
import 'package:test_soul_app/presentation/screens/file_transfer/file_transfer_screen.dart';
import 'package:test_soul_app/presentation/screens/console/console_screen.dart';
import 'package:test_soul_app/presentation/screens/settings/settings_screen.dart';

class Routes {
  static const String home = '/';
  static const String list = '/list';
  static const String tools = '/tools';
  static const String transfer = '/transfer';
  static const String console = '/console';
  static const String settings = '/settings';

  static Map<String, Widget Function(BuildContext)> routes = {
    home: (context) => const HomeScreen(),
    list: (context) => const ListScreen(),
    tools: (context) => const ToolsScreen(),
    transfer: (context) => const FileTransferScreen(),
    console: (context) => const ConsoleScreen(),
    settings: (context) => const SettingsScreen(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return _SmoothPageRoute(
      builder: (context) {
        final builder = routes[settings.name];
        if (builder != null) {
          return builder(context);
        }
        return const HomeScreen();
      },
      settings: settings,
    );
  }
}

class _SmoothPageRoute<T> extends PageRoute<T> {
  _SmoothPageRoute({
    required this.builder,
    RouteSettings? settings,
  }) : super(settings: settings);

  final WidgetBuilder builder;

  @override
  Color? get barrierColor => null;

  @override
  String? get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return builder(context);
  }

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    // 如果是第一个页面，不需要动画
    if (settings.name == Routes.home) {
      return child;
    }

    // 使用 Curves.easeOutQuart 提供更平滑的动画效果
    const curve = Curves.easeOutQuart;
    
    // 创建一个渐变动画，从0.6开始可以减少闪烁感
    final fadeAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    ).drive(Tween(begin: 0.6, end: 1.0));

    // 创建一个缩放动画，缩放范围更小以减少视觉跳动
    final scaleAnimation = CurvedAnimation(
      parent: animation,
      curve: curve,
    ).drive(Tween(begin: 0.99, end: 1.0));

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return FadeTransition(
          opacity: fadeAnimation,
          child: Transform.scale(
            scale: scaleAnimation.value,
            alignment: Alignment.center,
            child: child,
          ),
        );
      },
      child: child,
    );
  }
} 