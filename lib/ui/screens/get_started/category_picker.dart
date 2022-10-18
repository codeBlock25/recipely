part of get_started_ui;

class ImageGroup {
  late String title;
  late String image;
  ImageGroup({required this.title, required this.image}) {
    assert(() {
      if (title.trim().isEmpty) {
        throw FlutterError("Title can't be empty");
      } else if (image.trim().isEmpty) {
        throw FlutterError("Title can't be empty");
      }
      return true;
    }());
  }
}

final _recipeCategories = <ImageGroup>[
  ImageGroup(title: "Breakfast recipes", image: AssetsRes.BREAKFAST_RECIPES),
  ImageGroup(title: "Lunch recipes", image: AssetsRes.LUNCH_RECIPES),
  ImageGroup(title: "Dinner recipes", image: AssetsRes.DINNER_RECIPES),
  ImageGroup(title: "Appetizer recipes", image: AssetsRes.APPETIZER_RECIPES),
  ImageGroup(title: "Salad recipes", image: AssetsRes.SALAD_RECIPES),
  ImageGroup(
      title: "Main-course recipes", image: AssetsRes.MAIN_COURSE_RECIPES),
  ImageGroup(title: "Side-dish recipes", image: AssetsRes.SIDE_DISH_RECIPES),
  ImageGroup(
      title: "Baked-goods recipes", image: AssetsRes.BAKED_GOODS_RECIPES),
  ImageGroup(title: "Dessert recipes", image: AssetsRes.DESSERT_RECIPES),
  ImageGroup(title: "Snack recipes", image: AssetsRes.BAKED_GOODS_RECIPES),
  ImageGroup(title: "Soup recipes", image: AssetsRes.SOUP_RECIPES),
  ImageGroup(title: "Holiday recipes", image: AssetsRes.HOLIDAY_RECIPES),
];

final _cookTypes = <ImageGroup>[
  ImageGroup(title: "Chef", image: AssetsRes.CHEF),
  ImageGroup(title: "Hobbyist Chef", image: AssetsRes.HOBIEST_COOK),
  ImageGroup(title: "Home Cook", image: AssetsRes.HOME_COOK),
];

class RecipeCategoryPickerScreen extends StatefulScreen {
  const RecipeCategoryPickerScreen({Key? key}) : super(key: key);

  @override
  State<RecipeCategoryPickerScreen> createState() =>
      _RecipeCategoryPickerScreenState();

  @override
  ScreenConfig createConfig() => ScreenConfig(
      title: 'Pick your recipe category',
      path: '/get_Started/pick_category',
      transition: Transition.rightToLeft);
}

class _RecipeCategoryPickerScreenState
    extends State<RecipeCategoryPickerScreen> {
  final List<ImageGroup> selectedRecipeCategories = <ImageGroup>[];
  ImageGroup? selectedCookType;
  final PageController pageController = PageController();
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildGenericAppBar(context, 'Select Interest'),
      body: SizedBox(
        width: 100.w,
        height: 100.h,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20.sp,
            ),
            Expanded(
                child: PageView(
              onPageChanged: (int index) {
                setState(() {
                  pageIndex = index;
                });
              },
              controller: pageController,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'What recipes are you interested in?',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      SizedBox(
                        height: 20.sp,
                      ),
                      Text(
                        selectedRecipeCategories.length > 3
                            ? '3+'
                            : '${selectedRecipeCategories.length} / 3',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(
                        height: 10.sp,
                      ),
                      Expanded(
                        child: Wrap(
                            spacing: 5.sp,
                            runSpacing: 10.sp,
                            alignment: WrapAlignment.center,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            runAlignment: WrapAlignment.center,
                            children: _recipeCategories.map((category) {
                              final isSelected =
                                  selectedRecipeCategories.contains(category);
                              return RecipeCategoryTab(
                                  title: category.title,
                                  image: category.image,
                                  isSelected: isSelected,
                                  onPressed: () {
                                    setState(() {
                                      if (!isSelected) {
                                        selectedRecipeCategories.add(category);
                                      } else {
                                        selectedRecipeCategories
                                            .remove(category);
                                      }
                                    });
                                  });
                            }).toList()),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: <Widget>[
                    Text(
                      'How you best describe your self?',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    Expanded(
                      child: Wrap(
                          spacing: 5.w,
                          runSpacing: 5.w,
                          alignment: WrapAlignment.center,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          runAlignment: WrapAlignment.center,
                          children: _cookTypes.map((group) {
                            final isSelected = selectedCookType == group;
                            return CookTypeView(
                                group: group,
                                isSelected: isSelected,
                                onPressed: () {
                                  setState(() {
                                    selectedCookType = group;
                                  });
                                });
                          }).toList()),
                    ),
                  ],
                )
              ],
            )),
            TextButton(
                onPressed: () {
                  if (pageIndex < 1) {
                    pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeIn);
                  } else {
                    const HomeScreen().goto();
                  }
                },
                child: Text(
                  pageIndex < 1 ? 'Next' : 'Continue',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.copyWith(color: Colors.white),
                )),
            SizedBox(
              height: 30.sp,
            ),
          ],
        ),
      ),
    );
  }
}

class CookTypeView extends StatelessWidget {
  const CookTypeView(
      {Key? key,
      required this.group,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);

  final ImageGroup group;
  final bool isSelected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            padding: MaterialStateProperty.all(EdgeInsets.zero),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.sp),
              ),
            ),
          ),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.bounceInOut,
            transformAlignment: Alignment.center,
            width: isSelected ? 40.w : 35.w,
            height: isSelected ? 35.w : 30.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.sp),
              color: Theme.of(context).scaffoldBackgroundColor,
              image: DecorationImage(
                image: AssetImage(group.image),
                fit: BoxFit.cover,
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.black.withOpacity(0.4),
                  blurRadius: 50.sp,
                )
              ],
            ),
            clipBehavior: Clip.hardEdge,
            child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                color: !isSelected
                    ? Colors.transparent
                    : AppTheme.appColor.primaryColor.withOpacity(0.8),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1 : 0,
                  child: Center(
                    child: Icon(
                      UniconsLine.check_circle,
                      color: Colors.white,
                      size: 15.w,
                    ),
                  ),
                )),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Text(
          group.title,
          style: Theme.of(context).textTheme.headline5,
        ),
      ],
    );
  }
}

class RecipeCategoryTab extends StatelessWidget {
  const RecipeCategoryTab(
      {Key? key,
      required this.title,
      required this.image,
      required this.isSelected,
      required this.onPressed})
      : super(key: key);
  final String title;
  final String image;
  final bool isSelected;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onPressed,
        style: ButtonStyle(
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp)
                .copyWith(left: 5.sp),
          ),
          backgroundColor: MaterialStateProperty.all(AppTheme.appColor.white),
          shadowColor: MaterialStateProperty.all(
              AppTheme.appColor.dark.withOpacity(0.1)),
          elevation: MaterialStateProperty.all(20),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7.sp),
              side: BorderSide(
                  color: isSelected
                      ? AppTheme.appColor.primaryColor.withOpacity(0.5)
                      : Colors.transparent,
                  width: 1.sp),
            ),
          ),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Container(
              width: 22.sp,
              height: 22.sp,
              margin: EdgeInsets.symmetric(horizontal: 4.sp).copyWith(left: 0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.sp),
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )),
              clipBehavior: Clip.hardEdge,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                color: !isSelected
                    ? null
                    : AppTheme.appColor.primaryColor.withOpacity(.8),
                child: !isSelected
                    ? null
                    : const Icon(
                        UniconsLine.check_circle,
                        color: Colors.white,
                      ),
              )),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText2,
          )
        ]));
  }
}
