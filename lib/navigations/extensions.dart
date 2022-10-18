part of app_navigation;

extension AppNavigationHelper on List<StatefulScreen> {
  List<GetPage> get getPages => () {
        return map((screen) => GetPage(
            name: screen.createConfig().path,
            title: screen.createConfig().title,
            page: () => screen,
            transition: screen.createConfig().transition)).toList();
      }();
}

extension ScreenPage on StatefulScreen {
  GetPage get getPage => () {
        return GetPage(
            name: createConfig().path,
            page: () => this,
            title: createConfig().title);
      }();
}
