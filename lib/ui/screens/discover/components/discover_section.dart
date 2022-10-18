part of discover_ui;

class DiscoverSection extends StatefulWidget {
  const DiscoverSection({Key? key}) : super(key: key);

  @override
  State<DiscoverSection> createState() => _DiscoverSectionState();
}

class _DiscoverSectionState extends State<DiscoverSection> {
  final PageController _controller = PageController(viewportFraction: 0.7);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 20.sp, bottom: 10.sp),
          child: Row(
            children: <Widget>[
              Text(
                'Popular Recipes',
                style: Theme.of(context).textTheme.headline4,
              ),
              const Spacer(),
              TextButton(
                onPressed: () {},
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  minimumSize: MaterialStateProperty.all(
                    Size(50.sp, 20.sp),
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 5.sp, vertical: 2.sp),
                  ),
                ),
                child: Text(
                  'See All'.capitalize ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: AppTheme.appColor.primaryColor),
                ),
              ),
            ],
          ),
        ),
        AspectRatio(
          aspectRatio: 1 / .8,
          child: PageView(
            controller: _controller,
            pageSnapping: true,
            padEnds: true,
            physics: const BouncingScrollPhysics(),
            children: <Widget>[
              Container(
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.sp),
                    color: Colors.white,
                    image: DecorationImage(
                      image: const AssetImage(AssetsRes.HOLIDAY_RECIPES),
                      fit: BoxFit.cover,
                      alignment: Alignment.bottomCenter,
                      colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.5), BlendMode.darken),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 80.sp,
                        clipBehavior: Clip.hardEdge,
                        margin: EdgeInsets.symmetric(horizontal: 5.sp)
                            .copyWith(bottom: 5.sp),
                        decoration: BoxDecoration(
                          color: AppTheme.appColor.primaryColor.withOpacity(.8),
                          borderRadius: BorderRadius.circular(10.sp),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(
                            sigmaX: 5,
                            sigmaY: 5,
                          ),
                          child: Column(
                            children: <Widget>[],
                          ),
                        ),
                      ),
                    ],
                  )),
            ],
          ),
        )
      ],
    );
  }
}
