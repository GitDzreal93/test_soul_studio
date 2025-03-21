# 测试工具应用技术方案

## 1. 技术栈

### 基础框架
- Flutter SDK: ^3.5.4
- Dart SDK: ^3.5.4

### 状态管理
- flutter_riverpod: ^2.5.0 - 响应式状态管理库
- shared_preferences: ^2.2.2 - 本地数据存储

### UI/组件
- google_fonts: ^6.2.0 - 自定义字体支持
- flutter_svg: ^2.0.10+1 - SVG图标支持
- cached_network_image: ^3.3.1 - 图片缓存
- shimmer: ^3.0.0 - 加载态效果
- lottie: ^3.0.0 - 动画效果
- flutter_screenutil: ^5.9.0 - 屏幕适配

### 网络/通信
- dio: ^5.4.1 - HTTP请求客户端
- web_socket_channel: ^2.4.0 - WebSocket连接支持

### 设备功能
- path_provider: ^2.1.2 - 文件路径管理
- file_picker: ^6.1.1 - 文件选择器
- device_info_plus: ^9.1.2 - 设备信息获取
- permission_handler: ^11.3.0 - 权限处理

### 调试/开发工具
- logger: ^2.0.2+1 - 日志打印
- flutter_lints: ^4.0.0 - 代码规范检查

## 2. 目录结构

```
lib/
├── assets/                 # 静态资源
│   ├── icons/              # 图标资源
│   ├── images/             # 图片资源
│   └── animations/         # Lottie动画资源
│
├── config/                 # 配置文件
│   ├── app_config.dart     # 应用配置
│   ├── routes.dart         # 路由配置
│   └── themes.dart         # 主题配置
│
├── core/                   # 核心功能
│   ├── adb/                # ADB相关功能
│   │   ├── adb_service.dart
│   │   └── adb_command.dart
│   ├── file_transfer/      # 文件传输功能
│   │   ├── file_service.dart
│   │   └── transfer_model.dart
│   └── device/             # 设备相关功能
│       ├── device_service.dart
│       └── device_model.dart
│
├── data/                   # 数据层
│   ├── local/              # 本地数据
│   │   ├── preferences_helper.dart
│   │   └── database_helper.dart
│   ├── models/             # 数据模型
│   │   ├── tool_model.dart
│   │   ├── device_model.dart
│   │   └── setting_model.dart
│   ├── repositories/       # 数据仓库
│   │   ├── tool_repository.dart
│   │   └── settings_repository.dart
│   └── services/           # 服务
│       ├── api_service.dart
│       └── connection_service.dart
│
├── presentation/           # 表现层
│   ├── screens/            # 页面
│   │   ├── home/           # 首页
│   │   ├── list/           # 列表页
│   │   ├── tools/          # 工具页
│   │   ├── file_transfer/  # 文件传输页
│   │   ├── adb_console/    # ADB控制台页
│   │   └── settings/       # 设置页
│   ├── widgets/            # 通用组件
│   │   ├── app_bar.dart
│   │   ├── sidebar.dart
│   │   ├── tool_card.dart
│   │   └── device_item.dart
│   └── providers/          # 状态提供者
│       ├── theme_provider.dart
│       ├── tool_provider.dart
│       └── settings_provider.dart
│
├── utils/                  # 工具类
│   ├── constants.dart      # 常量
│   ├── extensions.dart     # 扩展方法
│   ├── logger.dart         # 日志工具
│   └── helpers.dart        # 辅助函数
│
└── main.dart               # 入口文件
```

## 3. 页面开发内容

### 3.1 首页（Home）
- 功能概述：展示设备连接状态和可用工具卡片
- 开发内容：
  - 设备连接状态显示
  - 工具卡片网格布局
  - 快速访问区域
  - 设备下拉选择器
  - 搜索工具功能

### 3.2 设备列表页（List）
- 功能概述：展示已连接设备和历史设备
- 开发内容：
  - 列表视图，包含设备信息
  - 设备筛选功能
  - 设备连接/断开操作
  - 设备状态指示器
  - 设备详情展示

### 3.3 工具页（Tools）
- 功能概述：各种测试工具集合
- 开发内容：
  - 工具分类列表
  - 工具详情页面
  - 工具执行界面
  - 结果显示区域
  - 收藏/常用工具功能

### 3.4 文件传输页（File Transfer）
- 功能概述：设备与电脑间文件传输
- 开发内容：
  - 文件浏览器
  - 拖拽上传区域
  - 传输进度显示
  - 传输历史记录
  - 文件操作菜单（复制、删除等）

### 3.5 ADB控制台（ADB Console）
- 功能概述：ADB命令执行界面
- 开发内容：
  - 命令输入区域
  - 命令历史记录
  - 命令执行结果显示
  - 常用命令快捷按钮
  - 命令自动完成功能

### 3.6 设置页（Settings）
- 功能概述：应用设置及配置
- 开发内容：
  - 主题设置（深色/浅色模式）
  - ADB路径配置
  - 日志级别设置
  - 数据清理选项
  - 关于/帮助信息

## 4. 样式规范

### 4.1 色彩方案
基于原型图中的色彩方案，我们定义以下主题色：

#### 主色调
- 主色：`#40916C` (2D6A4F)
- 主色亮色：`#52B788` (52B788)
- 主色暗色：`#081C15` (081C15)

#### 辅助色
- 浅绿色：`#D8F3DC` (D8F3DC)
- 中浅绿：`#B7E4C7` (B7E4C7)
- 中绿色：`#95D5B2` (95D5B2)
- 深绿色：`#74C69D` (74C69D)

#### 功能色
- 成功色：`#40916C` (功能成功提示)
- 错误色：`#E63946` (错误提示)
- 警告色：`#FFAA00` (警告提示)
- 信息色：`#457B9D` (信息提示)

#### 中性色
- 背景色：`#F8F9FA` (页面背景)
- 卡片背景：`#FFFFFF` (卡片和面板)
- 分割线：`#E9ECEF` (分隔线和边框)
- 文本色-主要：`#212529` (主要文本)
- 文本色-次要：`#6C757D` (次要文本)
- 文本色-禁用：`#ADB5BD` (禁用状态文本)

### 4.2 字体规范
- 主字体：PingFang SC, Microsoft YaHei (针对中文)
- 备选字体：Roboto (针对英文和数字)

### 4.3 尺寸规范
- 主要内容边距：16px
- 卡片内边距：16px
- 卡片圆角：8px
- 按钮圆角：4px
- 卡片阴影：`boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: Offset(0, 2))]`

### 4.4 响应式布局
使用 flutter_screenutil 实现不同设备上的屏幕适配，基准尺寸设置为：
- 设计稿宽度：375
- 设计稿高度：812

## 5. 公共组件封装

### 5.1 布局组件

#### AppScaffold
基础页面脚手架，包含侧边栏、顶部栏和内容区域。
```dart
AppScaffold({
  required Widget body,
  String title,
  List<Widget> actions,
  bool showBackButton,
  bool resizeToAvoidBottomInset,
})
```

#### SideBar
应用侧边栏组件，支持展开/收起，包含导航菜单。
```dart
SideBar({
  required List<SideBarItem> items,
  int selectedIndex,
  Function(int) onItemSelected,
  bool isExpanded,
})
```

#### AppHeader
应用顶部栏，包含标题、操作按钮和设备选择器。
```dart
AppHeader({
  String title,
  List<Widget> actions,
  bool showDeviceSelector,
  Function? onBackPressed,
})
```

### 5.2 数据展示组件

#### ToolCard
工具卡片组件，展示工具图标、名称和描述。
```dart
ToolCard({
  required String title,
  required IconData icon,
  String? description,
  Color? color,
  Function()? onTap,
  bool isFavorite,
})
```

#### DeviceItem
设备列表项组件，显示设备信息和状态。
```dart
DeviceItem({
  required DeviceModel device,
  bool isConnected,
  Function()? onConnect,
  Function()? onDisconnect,
  Function()? onInfo,
})
```

#### StatusBadge
状态徽章组件，用于显示各种状态指示器。
```dart
StatusBadge({
  required String text,
  StatusType type, // success, error, warning, info
})
```

### 5.3 输入组件

#### AppTextField
自定义文本输入框，统一样式和行为。
```dart
AppTextField({
  String? hint,
  String? label,
  TextEditingController? controller,
  IconData? prefixIcon,
  IconData? suffixIcon,
  Function()? onSuffixTap,
  bool obscureText,
  Function(String)? onChanged,
  TextInputType keyboardType,
})
```

#### AppButton
自定义按钮组件，支持不同样式和状态。
```dart
AppButton({
  required String text,
  required Function() onPressed,
  ButtonType type, // primary, secondary, text, outline
  ButtonSize size, // small, medium, large
  IconData? icon,
  bool isLoading,
  bool disabled,
})
```

#### SearchBar
搜索输入组件，包含搜索图标和清除按钮。
```dart
SearchBar({
  String hint,
  Function(String)? onSearch,
  Function()? onClear,
  TextEditingController? controller,
})
```

### 5.4 反馈组件

#### LoadingIndicator
加载指示器组件，包含旋转动画和文本。
```dart
LoadingIndicator({
  String? text,
  bool overlay,
})
```

#### EmptyState
空状态组件，显示无数据时的提示。
```dart
EmptyState({
  String title,
  String? subtitle,
  IconData? icon,
  Widget? action,
})
```

#### ErrorState
错误状态组件，显示错误信息和重试按钮。
```dart
ErrorState({
  String message,
  Function()? onRetry,
})
```

### 5.5 交互组件

#### AppDialog
自定义对话框组件，用于各种确认和信息提示。
```dart
AppDialog.show({
  required BuildContext context,
  required String title,
  required String content,
  String confirmText,
  String cancelText,
  Function()? onConfirm,
  Function()? onCancel,
})
```

#### ToastMessage
轻提示组件，用于简短的操作反馈信息。
```dart
ToastMessage.show({
  required String message,
  ToastType type, // success, error, info, warning
  Duration duration,
})
```

#### DropdownMenu
下拉菜单组件，用于选择操作或过滤条件。
```dart
DropdownMenu({
  required List<DropdownMenuItem> items,
  required Function(dynamic) onSelected,
  dynamic value,
  String? hint,
})
```

### 5.6 特殊组件

#### FileExplorer
文件浏览器组件，用于文件传输功能。
```dart
FileExplorer({
  required String path,
  Function(File)? onFileSelected,
  Function(Directory)? onDirectoryChanged,
  bool allowMultiSelection,
})
```

#### TerminalConsole
终端控制台组件，用于ADB命令执行。
```dart
TerminalConsole({
  List<String>? initialCommands,
  Function(String)? onCommandSubmit,
  bool readOnly,
})
```

#### TransferProgressBar
文件传输进度条组件，显示传输状态和速度。
```dart
TransferProgressBar({
  required double progress,
  required String fileName,
  String? speed,
  Function()? onCancel,
})
```

## 6. 性能优化考虑

1. **懒加载和按需加载**
   - 使用indexed_stack实现页面的懒加载
   - 长列表使用ListView.builder实现按需渲染

2. **图片优化**
   - 使用cached_network_image缓存网络图片
   - 使用WebP格式减小图片体积
   - 合理设置图片分辨率和质量

3. **状态管理优化**
   - 使用Riverpod的select方法避免不必要的重建
   - 合理划分状态粒度，避免过度重建

4. **构建优化**
   - 使用const构造器减少重建
   - 合理使用Widget拆分，避免大型Widget树
   - 使用RepaintBoundary隔离频繁重绘的区域

5. **网络优化**
   - 实现请求合并和缓存策略
   - 合理使用连接池和请求超时设置
   - 优先使用HTTP/2协议减少连接开销
