import 'package:flutter/material.dart';
import 'package:get/get.dart';
import "package:get_storage/get_storage.dart";
import 'package:recipely/config/config.dart';
import 'package:recipely/navigations/navigation.dart';
import 'package:recipely/themes/themes.dart';
import 'package:sizer/sizer.dart';
import 'package:wakelock/wakelock.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  if (AppConfig.isDev) {
    await Wakelock.enable();
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder:
        (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: AppConfig.isDev,
        home: AppNavigation.navigationList.first,
        getPages: AppNavigation.navigationList.getPages,
        themeMode: ThemeMode.light,
        enableLog: false,
        theme: AppTheme.theme.lightTheme,
        darkTheme: AppTheme.theme.darkTheme,
        debugShowMaterialGrid: false,
        title: '${AppConfig.appName} - Mobile',
      );
    });
  }
}
