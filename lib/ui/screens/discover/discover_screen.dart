part of discover_ui;

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 100.h,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: <Widget>[
          const DiscoverAppBar(),
          DiscoverBody(children: [
            const DiscoverAd(),
            const DiscoverSection(),
            SizedBox(
              height: 100.sp,
            ),
          ]),
        ],
      ),
    );
  }
}
