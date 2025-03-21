import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';
import 'package:test_soul_app/presentation/widgets/app_scaffold.dart';
import 'widgets/status_overview.dart';
import 'widgets/quick_action_card.dart';
import 'widgets/recent_activity_table.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '测试工具控制中心',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const StatusOverview(),
            const SizedBox(height: 24),
            _buildQuickActions(),
            const SizedBox(height: 24),
            _buildRecentActivities(),
          ],
        ),
      ),
    );
  }

  Widget _buildQuickActions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '快速操作',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        const Row(
          children: [
            Expanded(
              child: QuickActionCard(
                title: '快速测试',
                description: '启动预配置的测试套件，快速验证设备功能',
                icon: Icons.speed,
                iconColor: Colors.blue,
                onTap: null,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: QuickActionCard(
                title: '设备管理',
                description: '管理已连接的测试设备，查看设备状态',
                icon: Icons.devices,
                iconColor: Colors.green,
                onTap: null,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: QuickActionCard(
                title: '测试报告',
                description: '查看历史测试报告和分析数据',
                icon: Icons.assessment,
                iconColor: Colors.purple,
                onTap: null,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentActivities() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '最近活动',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppTheme.textPrimaryColor,
          ),
        ),
        const SizedBox(height: 16),
        const RecentActivityTable(),
      ],
    );
  }
} 