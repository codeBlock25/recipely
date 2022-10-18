part of shared_components_ui;

AppBar buildGenericAppBar(BuildContext context, String title) {
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(
        UniconsLine.angle_left_b,
        size: Theme.of(context).textTheme.headline3?.fontSize,
        color: AppTheme.setting
            .themeColor(context, lightColor: AppTheme.appColor.primary2Color),
      ),
    ),
    title: Text(
      title,
      style: Theme.of(context).textTheme.headline4,
    ),
    centerTitle: true,
    systemOverlayStyle: AppTheme.setting.setNavbarColor(
        context,
        Colors.transparent,
        Colors.transparent,
        AppTheme.setting.brightness(context: context, inverse: true)),
  );
}
