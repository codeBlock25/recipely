part of dashboard_ui;

class HomeScreenBody extends StatefulWidget {
  HomeScreenBody({Key? key, required this.page, required this.bottomTabs})
      : super(key: key) {
    assert(() {
      if (page.length != bottomTabs.length) {
        throw FlutterError(
            'Number of pages must match number of bottomTabs (pages = ${page.length} and bottomTabs = ${bottomTabs.length})');
      }
      return true;
    }());
  }
  final List<Widget> page;
  final List<BottomTabButtonType> bottomTabs;
  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  final PageController _controller = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: AppTheme.setting.setNavbarColor(
          context,
          Colors.transparent,
          Colors.transparent,
          AppTheme.setting.brightness(context: context, inverse: true),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        width: 100.w,
        height: 100.h,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsRes.BG),
            fit: BoxFit.cover,
            alignment: Alignment.center,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 50,
            sigmaY: 50,
          ),
          child: Container(
            height: 100.h,
            width: 100.w,
            color: Colors.white.withOpacity(0.6),
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                  child: PageView.builder(
                    itemCount: widget.page.length,
                    pageSnapping: true,
                    controller: _controller,
                    scrollDirection: Axis.horizontal,
                    scrollBehavior: const CupertinoScrollBehavior(),
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return widget.page[index];
                    },
                  ),
                ),
                BottomTabBar(
                  pageIndex: pageIndex,
                  bottomTabs: widget.bottomTabs,
                  onPressed: (int index) {
                    setState(() {
                      _controller.animateToPage(index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.decelerate);
                      pageIndex = index;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
