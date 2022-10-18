part of app_themes;

class _ThemeSwatch {
  ThemeData lightTheme = ThemeData(
    primarySwatch: AppTheme.appColor.primaryLightSwatch,
    primaryColor: AppTheme.appColor.primary2Color,
    splashColor: Colors.white38,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppTheme.appColor.primary2Color,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    ),
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppTheme.appColor.white,
    canvasColor: Colors.grey[100],
    dialogBackgroundColor: Colors.grey[200],
    snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating, elevation: 10),
    iconTheme: IconThemeData(
        color: AppTheme.appColor.primary2Color, size: 16.sp.clamp(18, 28)),
    typography: Typography(englishLike: const TextTheme()),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.sp),
      ),
      checkColor: MaterialStateProperty.all(
        AppTheme.appColor.primary2Color,
      ),
      fillColor: MaterialStateProperty.all(
        AppTheme.appColor.primary2Color,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 14.sp.clamp(12, 16),
              color: AppTheme.appColor.dark,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      bodyText2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 10.sp.clamp(8, 14),
              color: AppTheme.appColor.dark,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      button: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      caption: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 12.sp.clamp(10, 14),
              color: AppTheme.appColor.dark,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline1: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 36.sp.clamp(34, 38),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 32.sp.clamp(30, 34),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline3: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 24.sp.clamp(20, 26),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline4: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 18.sp.clamp(16, 20),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline5: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 14.sp.clamp(12, 16),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 12.sp.clamp(8, 12),
              color: AppTheme.appColor.dark,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      subtitle1: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: AppTheme.appColor.dark.withOpacity(0.7),
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      subtitle2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: AppTheme.appColor.dark.withOpacity(0.7),
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
    ),
    primaryIconTheme: IconThemeData(
        color: AppTheme.appColor.primaryColor, size: 16.sp.clamp(18, 28)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 12.sp),
      labelStyle: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 14.sp.clamp(12, 16),
              color: AppTheme.appColor.primary2Color,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.inActiveColor,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.primary2Color,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.primary2Color,
        ),
      ),
      prefixIconColor: AppTheme.appColor.primaryColor,
      suffixIconColor: AppTheme.appColor.primary2Color.withOpacity(0.7),
      hintStyle: GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: 12.sp.clamp(10, 16),
            textBaseline: TextBaseline.alphabetic,
            color: AppTheme.appColor.primary2Color.withOpacity(0.5),
            inherit: true),
      ),
    ),
  );
  ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: AppTheme.appColor.primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          AppTheme.appColor.primary2Color,
        ),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(horizontal: 20.sp, vertical: 5.sp),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.sp),
          ),
        ),
      ),
    ),
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xff181616),
        elevation: 0,
        shadowColor: Colors.transparent),
    splashColor: const Color(0xff181616),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    scaffoldBackgroundColor: AppTheme.appColor.black,
    canvasColor: Colors.grey[700],
    dialogBackgroundColor: Colors.grey[700],
    iconTheme: IconThemeData(
        color: AppTheme.appColor.primary2Color, size: 16.sp.clamp(18, 28)),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.sp),
      ),
      checkColor: MaterialStateProperty.all(
        AppTheme.appColor.primaryColor,
      ),
      fillColor: MaterialStateProperty.all(
        AppTheme.appColor.primaryColor,
      ),
    ),
    textTheme: TextTheme(
      bodyText1: GoogleFonts.montserrat(
          textStyle: TextStyle(
        fontSize: 14.sp.clamp(12, 16),
        color: Colors.white,
        textBaseline: TextBaseline.alphabetic,
        inherit: true,
      )),
      bodyText2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 10.sp.clamp(8, 14),
              color: Colors.white,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      button: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      caption: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 12.sp.clamp(10, 14),
              color: Colors.white,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline1: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 36.sp.clamp(34, 38),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 32.sp.clamp(30, 34),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline3: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 24.sp.clamp(20, 26),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline4: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 18.sp.clamp(16, 20),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline5: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 14.sp.clamp(12, 16),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      headline6: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 12.sp.clamp(8, 12),
              color: Colors.white,
              fontWeight: FontWeight.bold,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      subtitle1: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: Colors.white.withOpacity(0.7),
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      subtitle2: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 16.sp.clamp(14, 18),
              color: Colors.white.withOpacity(0.7),
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
    ),
    primaryIconTheme: IconThemeData(
        color: AppTheme.appColor.primaryColor, size: 16.sp.clamp(18, 28)),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.symmetric(horizontal: 0.sp, vertical: 12.sp),
      labelStyle: GoogleFonts.montserrat(
          textStyle: TextStyle(
              fontSize: 14.sp.clamp(12, 16),
              color: Colors.white,
              textBaseline: TextBaseline.alphabetic,
              inherit: true)),
      prefixIconColor: AppTheme.appColor.primaryColor,
      suffixIconColor: Colors.white.withOpacity(0.7),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.primary2Color,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.primary2Color,
        ),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.sp),
        borderSide: BorderSide(
          width: 2,
          style: BorderStyle.solid,
          color: AppTheme.appColor.primary2Color,
        ),
      ),
      hintStyle: GoogleFonts.montserrat(
        textStyle: TextStyle(
            fontSize: 12.sp.clamp(10, 16),
            textBaseline: TextBaseline.alphabetic,
            color: Colors.white.withOpacity(0.5),
            inherit: true),
      ),
    ),
  );
}
