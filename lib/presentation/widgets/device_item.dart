import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum DeviceStatus {
  online,
  offline,
  busy,
}

class DeviceItem extends StatelessWidget {
  final String name;
  final String imei;
  final String model;
  final String systemVersion;
  final DeviceStatus status;
  final String? ipAddress;
  final bool isAndroid;
  final VoidCallback? onTerminal;
  final VoidCallback? onStart;
  final VoidCallback? onInfo;
  final VoidCallback? onDelete;

  const DeviceItem({
    super.key,
    required this.name,
    required this.imei,
    required this.model,
    required this.systemVersion,
    required this.status,
    this.ipAddress,
    required this.isAndroid,
    this.onTerminal,
    this.onStart,
    this.onInfo,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          _buildDeviceIcon(),
          SizedBox(width: 16.w),
          _buildDeviceInfo(),
          SizedBox(width: 16.w),
          _buildModel(),
          SizedBox(width: 16.w),
          _buildSystemVersion(),
          SizedBox(width: 16.w),
          _buildStatus(),
          SizedBox(width: 16.w),
          _buildIpAddress(),
          SizedBox(width: 16.w),
          _buildActions(),
        ],
      ),
    );
  }

  Widget _buildDeviceIcon() {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: isAndroid ? Colors.blue[50] : Colors.grey[100],
        shape: BoxShape.circle,
      ),
      child: Icon(
        isAndroid ? Icons.android : Icons.apple,
        color: isAndroid ? Colors.blue[600] : Colors.grey[600],
        size: 24.sp,
      ),
    );
  }

  Widget _buildDeviceInfo() {
    return Expanded(
      flex: 2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'IMEI: $imei',
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildModel() {
    return Expanded(
      child: Text(
        model,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildSystemVersion() {
    return Expanded(
      child: Text(
        systemVersion,
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildStatus() {
    final Color backgroundColor;
    final Color textColor;
    final String text;

    switch (status) {
      case DeviceStatus.online:
        backgroundColor = Colors.green[50]!;
        textColor = Colors.green[800]!;
        text = '在线';
        break;
      case DeviceStatus.offline:
        backgroundColor = Colors.red[50]!;
        textColor = Colors.red[800]!;
        text = '离线';
        break;
      case DeviceStatus.busy:
        backgroundColor = Colors.yellow[50]!;
        textColor = Colors.yellow[800]!;
        text = '忙碌';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          color: textColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildIpAddress() {
    return Expanded(
      child: Text(
        ipAddress ?? '--',
        style: TextStyle(
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
      ),
    );
  }

  Widget _buildActions() {
    final bool isOffline = status == DeviceStatus.offline;

    return Row(
      children: [
        _buildActionButton(
          icon: Icons.terminal,
          color: Colors.blue,
          onPressed: isOffline ? null : onTerminal,
        ),
        SizedBox(width: 8.w),
        _buildActionButton(
          icon: Icons.play_arrow,
          color: Colors.green,
          onPressed: isOffline ? null : onStart,
        ),
        SizedBox(width: 8.w),
        _buildActionButton(
          icon: Icons.info_outline,
          color: Colors.amber,
          onPressed: onInfo,
        ),
        SizedBox(width: 8.w),
        _buildActionButton(
          icon: Icons.delete_outline,
          color: Colors.red,
          onPressed: onDelete,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required Color color,
    VoidCallback? onPressed,
  }) {
    final isDisabled = onPressed == null;
    
    return IconTheme(
      data: IconThemeData(
        color: color,
        opacity: isDisabled ? 0.5 : 1.0,
        size: 20.sp,
      ),
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
        style: IconButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size(32.w, 32.w),
        ),
      ),
    );
  }
} 