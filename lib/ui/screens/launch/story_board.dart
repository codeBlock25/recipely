part of launch_ui;

class StoryBoard extends StatefulScreen {
  const StoryBoard({Key? key}) : super(key: key);

  @override
  State<StoryBoard> createState() => _StoryBoardState();

  @override
  ScreenConfig createConfig() => ScreenConfig(
      title: 'Recipes at ${AppConfig.appName}',
      path: '/store_board',
      transition: Transition.fadeIn);
}

class _StoryBoardState extends State<StoryBoard> {
  int pageIndex = 0;
  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        systemOverlayStyle: AppTheme.setting.setNavbarColor(
            context,
            Colors.transparent,
            Colors.transparent,
            AppTheme.setting.brightness(context: context, inverse: true)),
      ),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Stack(
          children: <Widget>[
            SizedBox(
              width: 100.w,
              height: 100.h,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 60.h,
                    child: PageView(
                      controller: _pageController,
                      onPageChanged: (int? index) {
                        setState(() {
                          pageIndex = index ?? 0;
                        });
                      },
                      children: [
                        Image.asset(
                          AssetsRes.STORE_BOARD_IMAGE1,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fitWidth,
                          width: 100.w,
                          height: 60.h,
                        ),
                        Image.asset(
                          AssetsRes.STORE_BOARD_IMAGE2,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fitWidth,
                          width: 100.w,
                          height: 60.h,
                        ),
                        Image.asset(
                          AssetsRes.STORE_BOARD_IMAGE3,
                          alignment: Alignment.bottomCenter,
                          fit: BoxFit.fitWidth,
                          width: 100.w,
                          height: 60.h,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      StoreBoardPageIndicator(
                        isActive: pageIndex == 0,
                        onClick: () {
                          setState(() {
                            _pageController.animateToPage(0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                      ),
                      StoreBoardPageIndicator(
                        isActive: pageIndex == 1,
                        onClick: () {
                          setState(() {
                            _pageController.animateToPage(1,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                      ),
                      StoreBoardPageIndicator(
                        isActive: pageIndex == 2,
                        onClick: () {
                          setState(() {
                            _pageController.animateToPage(2,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          });
                        },
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 30.sp,
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Discover all the best recipes you needed',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 20.sp, vertical: 15.sp),
                    alignment: Alignment.center,
                    child: Text(
                      '5000+ healthy recipes made by people for your healthy life',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                  TextButton(
                      onPressed: () {
                        if (pageIndex >= 2) {
                          const RegisterScreen().goto();
                          return;
                        }
                        setState(() {
                          pageIndex++;
                          _pageController.animateToPage(pageIndex,
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn);
                        });
                      },
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                          Size(200.sp.clamp(180, 400), 40.sp),
                        ),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.sp),
                          ),
                        ),
                      ),
                      child: Text(
                        pageIndex >= 2 ? 'Get Started' : 'Next',
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            ?.copyWith(color: Colors.white),
                      )),
                  const Spacer(
                    flex: 3,
                  ),
                ],
              ),
            ),
            Positioned(
              width: 100.w,
              height: 40.sp + 10.sp + MediaQuery.of(context).padding.top,
              child: Container(
                margin: EdgeInsets.only(
                  right: 10.sp,
                  top: 10.sp + MediaQuery.of(context).padding.top,
                ),
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    const LoginScreen().goto();
                  },
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent)),
                  child: Text(
                    'Skip',
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class StoreBoardPageIndicator extends StatelessWidget {
  const StoreBoardPageIndicator(
      {Key? key, required this.isActive, required this.onClick})
      : super(key: key);
  final bool isActive;
  final Function() onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        alignment: Alignment.center,
        transformAlignment: Alignment.center,
        curve: Curves.easeIn,
        width: isActive ? 30.sp : 10.sp,
        height: 10.sp,
        margin: EdgeInsets.all(6.sp),
        decoration: BoxDecoration(
          color: isActive
              ? AppTheme.appColor.primary2Color
              : AppTheme.appColor.primary2Color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20.sp),
          boxShadow: [
            BoxShadow(
                color: !isActive
                    ? AppTheme.appColor.white
                    : AppTheme.appColor.primary2Color,
                spreadRadius: 4.sp,
                blurStyle: BlurStyle.inner),
            BoxShadow(
                color: isActive
                    ? AppTheme.appColor.white
                    : AppTheme.appColor.primary2Color.withOpacity(0.2),
                spreadRadius: 2.sp,
                blurStyle: BlurStyle.inner),
          ],
        ),
      ),
    );
  }
}
