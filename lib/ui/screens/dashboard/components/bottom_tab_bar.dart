part of dashboard_ui;

class BottomTabBar extends StatefulWidget {
  const BottomTabBar(
      {Key? key,
      required this.bottomTabs,
      required this.pageIndex,
      required this.onPressed})
      : super(key: key);
  final List<BottomTabButtonType> bottomTabs;
  final int pageIndex;
  final void Function(int) onPressed;
  @override
  State<BottomTabBar> createState() => _BottomTabBarState();
}

class _BottomTabBarState extends State<BottomTabBar> {
  @override
  Widget build(BuildContext context) {
    final bottomTabs = widget.bottomTabs;
    final int bottomIndex = widget.pageIndex;
    return Positioned(
      left: 5.w,
      bottom: 10.sp + MediaQuery.of(context).padding.bottom,
      child: Container(
        width: 90.w,
        height: 50.sp.clamp(55, 75),
        padding: EdgeInsets.symmetric(horizontal: 5.sp),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.sp),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 20.sp,
              )
            ]),
        child: Stack(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: bottomTabs.map((bottomTab) {
                final index = bottomTabs.indexOf(bottomTab);
                return BottomTabButton(
                  label: bottomTab.label,
                  icon: bottomTab.icon,
                  isSelected: bottomIndex == index,
                  onPressed: () => widget.onPressed(index),
                );
              }).toList(),
            ),
            AnimatedPositioned(
              duration: const Duration(milliseconds: 200),
              curve: Curves.decelerate,
              top: (50.sp / 2),
              left: (bottomIndex * (90.w / 5)) +
                  90.w /
                      (bottomIndex == 0
                          ? 12
                          : bottomIndex == 1
                              ? 13
                              : bottomIndex == 4
                                  ? 17
                                  : 15),
              child: Container(
                width: 1,
                height: 1,
                decoration:
                    BoxDecoration(color: Colors.black, boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.black.withOpacity(.8),
                      blurRadius: 20.sp,
                      spreadRadius: 10.sp)
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomTabButton extends StatelessWidget {
  const BottomTabButton(
      {Key? key,
      required this.isSelected,
      required this.label,
      required this.icon,
      required this.onPressed})
      : super(key: key);
  final bool isSelected;
  final String label;
  final IconData icon;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.transparent),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        overlayColor: MaterialStateProperty.all(
          Colors.grey.withOpacity(0.05),
        ),
        fixedSize: MaterialStateProperty.all(
          Size(
            (90.w - 10.sp) / 5,
            50.sp.clamp(55, 75),
          ),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            size: Theme.of(context).textTheme.headline4?.fontSize,
            color: Theme.of(context).textTheme.headline4?.color,
          ),
          SizedBox(
            height: 2.sp,
          ),
          Text(
            label,
            style: isSelected
                ? Theme.of(context).textTheme.headline6
                : Theme.of(context).textTheme.bodyText2?.copyWith(
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize),
          ),
        ],
      ),
    );
  }
}
