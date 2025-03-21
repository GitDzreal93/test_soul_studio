import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_soul_app/presentation/widgets/app_scaffold.dart';
import 'package:test_soul_app/presentation/widgets/device_item.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      title: '测试设备列表',
      actions: [
        IconButton(
          icon: const Icon(Icons.refresh),
          onPressed: () {
            // TODO: 实现刷新功能
          },
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // TODO: 实现添加设备功能
          },
        ),
      ],
      body: Column(
        children: [
          _buildFilterSection(),
          Expanded(
            child: _buildDeviceList(),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      margin: EdgeInsets.all(16.r),
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildFilterDropdown(
            label: '平台:',
            items: const ['全部', 'Android', 'iOS'],
            onChanged: (value) {
              // TODO: 实现平台筛选
            },
          ),
          SizedBox(width: 16.w),
          _buildFilterDropdown(
            label: '状态:',
            items: const ['全部', '在线', '离线', '忙碌'],
            onChanged: (value) {
              // TODO: 实现状态筛选
            },
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '搜索设备名称、ID或型号...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 16.w,
                  vertical: 12.h,
                ),
              ),
              onChanged: (value) {
                // TODO: 实现搜索功能
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterDropdown({
    required String label,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: DropdownButton<String>(
            value: items.first,
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            }).toList(),
            onChanged: onChanged,
            underline: const SizedBox(),
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDeviceList() {
    // 示例数据
    final devices = [
      DeviceItem(
        name: 'Pixel 6',
        imei: '352738495827364',
        model: 'Google Pixel 6',
        systemVersion: 'Android 12',
        status: DeviceStatus.online,
        ipAddress: '192.168.1.101',
        isAndroid: true,
        onTerminal: () {},
        onStart: () {},
        onInfo: () {},
        onDelete: () {},
      ),
      DeviceItem(
        name: 'iPhone 13',
        imei: '493726593847563',
        model: 'Apple iPhone 13',
        systemVersion: 'iOS 15.4',
        status: DeviceStatus.busy,
        ipAddress: '192.168.1.102',
        isAndroid: false,
        onTerminal: () {},
        onStart: () {},
        onInfo: () {},
        onDelete: () {},
      ),
      DeviceItem(
        name: 'Galaxy S21',
        imei: '583927465928374',
        model: 'Samsung Galaxy S21',
        systemVersion: 'Android 12',
        status: DeviceStatus.offline,
        ipAddress: null,
        isAndroid: true,
        onTerminal: null,
        onStart: null,
        onInfo: () {},
        onDelete: () {},
      ),
    ];

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.r),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListView.separated(
        padding: EdgeInsets.all(16.r),
        itemCount: devices.length,
        separatorBuilder: (context, index) => Divider(height: 1.h),
        itemBuilder: (context, index) => devices[index],
      ),
    );
  }
} 