import 'package:flutter/material.dart';
import 'package:test_soul_app/presentation/widgets/app_scaffold.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      title: '设置',
      body: Center(
        child: Text('设置页面开发中...'),
      ),
    );
  }
} 