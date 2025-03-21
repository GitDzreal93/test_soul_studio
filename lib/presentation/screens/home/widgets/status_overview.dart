import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';

class StatusOverview extends StatelessWidget {
  const StatusOverview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '系统状态',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              _buildStatusCard(
                icon: Icons.devices,
                iconColor: Colors.blue,
                label: '已连接设备',
                value: '3',
                backgroundColor: Colors.blue.shade50,
              ),
              const SizedBox(width: 24),
              _buildStatusCard(
                icon: Icons.check_circle,
                iconColor: Colors.green,
                label: '测试通过',
                value: '28',
                backgroundColor: Colors.green.shade50,
              ),
              const SizedBox(width: 24),
              _buildStatusCard(
                icon: Icons.error,
                iconColor: Colors.red,
                label: '测试失败',
                value: '2',
                backgroundColor: Colors.red.shade50,
              ),
              const SizedBox(width: 24),
              _buildStatusCard(
                icon: Icons.timer,
                iconColor: Colors.purple,
                label: '运行时间',
                value: '3h 45m',
                backgroundColor: Colors.purple.shade50,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusCard({
    required IconData icon,
    required Color iconColor,
    required String label,
    required String value,
    required Color backgroundColor,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.circular(AppTheme.cardRadius),
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24,
              ),
            ),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: AppTheme.textSecondaryColor,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(
                    color: AppTheme.textPrimaryColor,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} 