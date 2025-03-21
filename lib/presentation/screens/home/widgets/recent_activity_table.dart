import 'package:flutter/material.dart';
import 'package:test_soul_app/config/themes.dart';

class RecentActivityTable extends StatelessWidget {
  const RecentActivityTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.cardRadius),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          const Divider(height: 1),
          _buildTableRow(
            time: '10:30 AM',
            device: 'Pixel 6',
            activity: 'UI自动化测试',
            status: ActivityStatus.success,
          ),
          const Divider(height: 1),
          _buildTableRow(
            time: '09:45 AM',
            device: 'iPhone 13',
            activity: '性能测试',
            status: ActivityStatus.running,
          ),
          const Divider(height: 1),
          _buildTableRow(
            time: '09:15 AM',
            device: 'Galaxy S21',
            activity: '兼容性测试',
            status: ActivityStatus.failed,
          ),
          const Divider(height: 1),
          _buildTableRow(
            time: '08:30 AM',
            device: 'Pixel 5',
            activity: '安装测试',
            status: ActivityStatus.success,
          ),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        children: [
          _buildHeaderCell('时间', flex: 1),
          _buildHeaderCell('设备', flex: 1),
          _buildHeaderCell('活动', flex: 2),
          _buildHeaderCell('状态', flex: 1),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          color: AppTheme.textSecondaryColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTableRow({
    required String time,
    required String device,
    required String activity,
    required ActivityStatus status,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        children: [
          Expanded(
            child: Text(
              time,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: Text(
              device,
              style: TextStyle(
                color: AppTheme.textPrimaryColor,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              activity,
              style: TextStyle(
                color: AppTheme.textSecondaryColor,
                fontSize: 14,
              ),
            ),
          ),
          Expanded(
            child: _buildStatusBadge(status),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(ActivityStatus status) {
    Color backgroundColor;
    Color textColor;
    String text;

    switch (status) {
      case ActivityStatus.success:
        backgroundColor = Colors.green.shade50;
        textColor = Colors.green.shade700;
        text = '成功';
        break;
      case ActivityStatus.running:
        backgroundColor = Colors.yellow.shade50;
        textColor = Colors.yellow.shade700;
        text = '进行中';
        break;
      case ActivityStatus.failed:
        backgroundColor = Colors.red.shade50;
        textColor = Colors.red.shade700;
        text = '失败';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: textColor,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

enum ActivityStatus {
  success,
  running,
  failed,
} 