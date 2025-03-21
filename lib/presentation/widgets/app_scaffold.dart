import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';
import 'sidebar.dart';
import 'app_header.dart';

class AppScaffold extends StatelessWidget {
  final Widget body;
  final String? title;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool resizeToAvoidBottomInset;

  const AppScaffold({
    super.key,
    required this.body,
    this.title,
    this.actions,
    this.showBackButton = false,
    this.resizeToAvoidBottomInset = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: Column(
              children: [
                AppHeader(
                  title: title,
                  actions: actions,
                  showBackButton: showBackButton,
                ),
                Expanded(
                  child: Container(
                    color: AppTheme.backgroundColor,
                    padding: const EdgeInsets.all(AppTheme.contentPadding),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 