part of discover_ui;

class DiscoverAppBar extends StatefulWidget {
  const DiscoverAppBar({Key? key}) : super(key: key);

  @override
  State<DiscoverAppBar> createState() => _DiscoverAppBarState();
}

class _DiscoverAppBarState extends State<DiscoverAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: 150.sp,
        pinned: true,
        snap: true,
        toolbarHeight: 60.sp,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        automaticallyImplyLeading: false,
        flexibleSpace: Container(
          width: 100.w,
          height: 150.sp,
          decoration: const BoxDecoration(color: Colors.transparent),
          clipBehavior: Clip.hardEdge,
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20,
              sigmaY: 20,
            ),
            child: const SizedBox(),
          ),
        ),
        floating: true,
        title: Container(
          width: 100.w,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          margin: EdgeInsets.only(top: 4.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Icon(
                    DateTime.now().hour < 12
                        ? UniconsLine.sunset
                        : DateTime.now().hour > 16
                            ? UniconsLine.moon
                            : UniconsLine.sun,
                    size: Theme.of(context).textTheme.headline4?.fontSize,
                    color: AppTheme.appColor.primaryColor,
                  ),
                  SizedBox(
                    width: 2.sp,
                  ),
                  Text(
                    'Good morning',
                    style: Theme.of(context).textTheme.bodyText2,
                  )
                ],
              ),
              Text(
                'Daniel Amos',
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          ),
        ),
        bottom: AppBar(
          leadingWidth: 0,
          toolbarHeight: 90.sp,
          backgroundColor: Colors.transparent,
          leading: const SizedBox(),
          title: Container(
            width: 100.w,
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            alignment: Alignment.center,
            child: Column(mainAxisAlignment: MainAxisAlignment.end, children: <
                Widget>[
              Row(
                children: <Widget>[
                  Text(
                    'Discover',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  const Spacer(),
                  SizedBox(
                    width: 30.sp,
                    height: 30.sp,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(2.sp),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.7),
                        ),
                      ),
                      icon: Icon(
                        UniconsLine.shuffle,
                        size: Theme.of(context).textTheme.headline4?.fontSize,
                        color: Theme.of(context).textTheme.headline4?.color,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 30.sp,
                    height: 30.sp,
                    child: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.all(2.sp),
                      style: ButtonStyle(
                        overlayColor: MaterialStateProperty.all(
                          Colors.white.withOpacity(0.7),
                        ),
                      ),
                      icon: Icon(
                        UniconsLine.bell,
                        size: Theme.of(context).textTheme.headline4?.fontSize,
                        color: Theme.of(context).textTheme.headline4?.color,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                width: 90.w,
                height: 40.sp,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.1),
                  borderRadius: BorderRadius.circular(10.sp),
                ),
                alignment: Alignment.center,
                child: TextField(
                  style: Theme.of(context).textTheme.bodyText2,
                  decoration: InputDecoration(
                    hintText: 'Search over 5000+ recipes',
                    contentPadding: EdgeInsets.symmetric(vertical: 15.sp),
                    hintStyle: Theme.of(context).textTheme.bodyText2?.copyWith(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText2
                              ?.color
                              ?.withOpacity(.4),
                        ),
                    prefixIcon: SizedBox(
                      height: 40.sp,
                      width: 40.sp,
                      child: Icon(
                        UniconsLine.search,
                        color: AppTheme.appColor.dark,
                      ),
                    ),
                    enabledBorder: InputBorder.none,
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                  ),
                ),
              ),
            ]),
          ),
        ));
  }
}
