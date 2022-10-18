part of discover_ui;

class DiscoverAd extends StatelessWidget {
  const DiscoverAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 352 / 152,
      child: Container(
        width: 100.w,
        decoration: BoxDecoration(
            color: AppTheme.appColor.primaryColor,
            borderRadius: BorderRadius.circular(10.sp),
            image: const DecorationImage(
              image: AssetImage(AssetsRes.AD1),
              fit: BoxFit.cover,
              alignment: Alignment.center,
            )),
      ),
    );
  }
}
