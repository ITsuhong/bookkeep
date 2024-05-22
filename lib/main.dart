import 'package:bookkeep/page/base_page.dart';
import 'package:bookkeep/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      // 设置状态栏图标为黑色（适合浅色背景）
      statusBarBrightness: Brightness.light,
      // 设置状态栏为浅色背景
      systemNavigationBarColor: Colors.transparent,
      // 设置导航栏背景颜色
      systemNavigationBarIconBrightness: Brightness.light, // 设置导航栏图标颜色
    ));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        useMaterial3: true,
      ),
      getPages: Routes.routes,
      initialRoute: '/',
    );
  }
}
