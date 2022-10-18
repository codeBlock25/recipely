part of app_themes;

class _ThemeSetting {
  /// Check if its in dark mode
  bool Function(BuildContext) isDarkMode =
      (BuildContext context) => Theme.of(context).brightness == Brightness.dark;

  /// Check if its in dark mode
  Color? themeColor(BuildContext context,
      {Color? lightColor, Color? darkColor}) {
    return !isDarkMode(context)
        ? (lightColor ?? AppTheme.appColor.black)
        : (darkColor ?? AppTheme.appColor.white);
  }

  /// Get isDarkMode info from local storage and return ThemeMode
  Brightness brightness(
      {BuildContext? context,
      Brightness? currentBrightness,
      bool? inverse = false}) {
    // no context
    if (context == null) {
      // but should be unversed
      if (inverse == true) {
        return Brightness.dark;
      } else {
        return Brightness.light;
      }
    } else if (currentBrightness is Brightness) {
      if (inverse == true) {
        return currentBrightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark;
      } else {
        return currentBrightness;
      }
    } else {
      if (inverse == true) {
        return Theme.of(context).brightness == Brightness.dark
            ? Brightness.light
            : Brightness.dark;
      } else {
        return Theme.of(context).brightness;
      }
    }
  }

  SystemUiOverlayStyle setNavbarColor(BuildContext context, Color? topBarColor,
          Color? bottomBarColor, Brightness? iconBrightness) =>
      SystemUiOverlayStyle(
        /// top background color
        statusBarColor: topBarColor ??
            themeColor(context,
                darkColor: Colors.grey[900], lightColor: Colors.white),

        /// bottom background color
        systemNavigationBarColor: bottomBarColor ??
            themeColor(context,
                darkColor: Colors.grey[900], lightColor: Colors.white),

        /// top icons color for iOS
        statusBarBrightness: iconBrightness ?? Theme.of(context).brightness,

        /// top icons color for Android
        statusBarIconBrightness: iconBrightness ?? Theme.of(context).brightness,

        /// bottom icons color for Android
        systemNavigationBarIconBrightness:
            iconBrightness ?? Theme.of(context).brightness,

        /// don't know it user TODO: learn this
        systemStatusBarContrastEnforced: false,
        systemNavigationBarContrastEnforced: false,
        systemNavigationBarDividerColor: Colors.transparent,
      );
}
