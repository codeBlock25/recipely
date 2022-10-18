library app_config;

import 'package:flutter/foundation.dart';

part "app_credentials.dart";

class AppConfig {
  AppConfig._();

  /// Return true is application is in development state
  static bool isDev = _isDev;

  /// Returns application name
  static String appName = _appName;
}
