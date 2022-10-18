part of launch_ui;

class SplashScreen extends StatefulScreen {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  @override
  ScreenConfig createConfig() => ScreenConfig(
      title: 'Welcome to ${AppConfig.appName}',
      path: '/',
      transition: Transition.fadeIn);
}

class _SplashScreenState extends State<SplashScreen> {
  bool stateAnimationToNextStage = false;
  bool stateAnimationToNextPage = false;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        stateAnimationToNextPage = true;
      });
    });

    Future.delayed(const Duration(milliseconds: 2500), () {
      const StoryBoard().goto();
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
            AppTheme.setting.brightness(context: context, inverse: true)),
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          GestureDetector(
              onTap: () {
                // setState(() {
                //   stateAnimationToNextPage = true;
                // });
                //
                // Future.delayed(const Duration(milliseconds: 500), () {
                //   const StoryBoard().goto();
                //
                //   setState(() {
                //     stateAnimationToNextPage = false;
                //   });
                // });
              },
              child: Container(
                width: 100.w,
                height: 100.h,
                clipBehavior: Clip.none,
                child: Center(
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: <Widget>[
                      Image.asset(
                        AssetsRes.APP_LOGO,
                        width: MediaQuery.of(context).size.shortestSide * 0.8,
                        height: MediaQuery.of(context).size.shortestSide * 0.8,
                        fit: BoxFit.fitWidth,
                      ),
                      Positioned(
                        bottom: 10.sp,
                        child: Text(
                          AppConfig.appName,
                          style: GoogleFonts.pacifico(
                              textStyle: Theme.of(context).textTheme.headline2),
                        ),
                      ),
                      AnimatedPositioned(
                        duration: const Duration(milliseconds: 1200),
                        width: stateAnimationToNextPage
                            ? MediaQuery.of(context).size.longestSide * 2
                            : 0.w,
                        height: stateAnimationToNextPage
                            ? MediaQuery.of(context).size.longestSide * 2
                            : 0.w,
                        child: Container(
                          clipBehavior: Clip.none,
                          decoration: BoxDecoration(
                            color: AppTheme.appColor.white,
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.longestSide),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
