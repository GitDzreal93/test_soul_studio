import 'package:flutter/material.dart';
import 'package:test_soul_app/presentation/widgets/app_scaffold.dart';

class ToolsScreen extends StatelessWidget {
  const ToolsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: '工具导航',
      body: Center(
        child: Text('工具导航页面开发中...'),
      ),
    );
  }
} 