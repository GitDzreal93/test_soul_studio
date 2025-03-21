import 'package:flutter/material.dart';
import 'package:test_soul_app/presentation/widgets/app_scaffold.dart';

class ConsoleScreen extends StatelessWidget {
  const ConsoleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: 'ADB控制台',
      body: Center(
        child: Text('ADB控制台页面开发中...'),
      ),
    );
  }
} 