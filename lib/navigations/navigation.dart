library app_navigation;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipely/ui/ui.dart';

part 'extensions.dart';
part 'screen.dart';

class AppNavigation {
  AppNavigation._();

  static List<StatefulScreen> navigationList = <StatefulScreen>[
    const SplashScreen(),
    const StoryBoard(),
    const RegisterScreen(),
    const LoginScreen(),
    const RecipeCategoryPickerScreen(),
    const HomeScreen(),
  ];
}
