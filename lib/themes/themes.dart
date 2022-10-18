library app_themes;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

part 'colors.dart';
part 'theme_data.dart';
part 'theme_setting.dart';

class AppTheme {
  AppTheme._();

  static _AppColor appColor = _AppColor();

  static _ThemeSwatch theme = _ThemeSwatch();

  static _ThemeSetting setting = _ThemeSetting();
}
