part of discover_ui;

class DiscoverBody extends StatelessWidget {
  const DiscoverBody({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp).copyWith(top: 20.sp),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, children: children),
        )
      ]),
    );
  }
}
