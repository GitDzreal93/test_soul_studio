import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_soul_app/config/themes.dart';
import 'package:test_soul_app/presentation/screens/home/home_screen.dart';
import 'package:test_soul_app/config/routes.dart';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:window_size/window_size.dart' as window_size;
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // 设置窗口尺寸约束（仅在桌面平台）
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    try {
      // 获取屏幕尺寸
      final window = await window_size.getWindowInfo();
      final screenFrame = window.frame;
      
      const minSize = Size(1024, 768);
      window_size.setWindowMinSize(minSize);
      
      const initialSize = Size(1024, 768);
      window_size.setWindowFrame(
        Rect.fromCenter(
          center: Offset(
            screenFrame.center.dx,
            screenFrame.center.dy,
          ),
          width: initialSize.width,
          height: initialSize.height,
        ),
      );
    } catch (e) {
      debugPrint('设置窗口尺寸失败: $e');
    }
  }
  
  // 设置横屏模式
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      // 修改设计稿尺寸为1:1
      designSize: const Size(1000, 1000),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: '测试工具',
          theme: AppTheme.lightTheme,
          initialRoute: Routes.home,
          onGenerateRoute: Routes.onGenerateRoute,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
