part of app_themes;

MaterialColor createMaterialColor(Color color, [reverse = false]) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = {};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  for (var strength in strengths) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  }
  return MaterialColor(color.value, swatch);
}

class _AppColor {
  Color primaryColor = const Color(0xff70B9BE);
  Color primary2Color = const Color(0xff062528);

  Color inActiveColor = const Color(0xffF2F3F7);

  Color dark = const Color(0xff152516);

  Color white = const Color(0xffFFFFFF);
  Color black = const Color(0xff101010);

  MaterialColor primaryLightSwatch =
      createMaterialColor(const Color(0xff70B9BE));
}
