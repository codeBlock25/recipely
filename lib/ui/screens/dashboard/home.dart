part of dashboard_ui;

class HomeScreen extends StatefulScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  @override
  ScreenConfig createConfig() =>
      ScreenConfig(title: AppConfig.appName, path: '/home');
}

class BottomTabButtonType {
  late String label;
  late IconData icon;
  BottomTabButtonType({required this.label, required this.icon});
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomIndex = 0;
  List<BottomTabButtonType> bottomTabs = <BottomTabButtonType>[
    BottomTabButtonType(label: 'Discover', icon: UniconsLine.utensils_alt),
    BottomTabButtonType(label: 'Groceries', icon: Icons.kitchen),
    BottomTabButtonType(label: 'Calories', icon: UniconsLine.comparison),
    BottomTabButtonType(label: 'Market', icon: UniconsLine.shop),
    BottomTabButtonType(label: 'Settings', icon: UniconsLine.cog),
  ];
  @override
  Widget build(BuildContext context) {
    return HomeScreenBody(
      page: [
        const DiscoverScreen(),
        Container(
          color: Colors.blue,
        ),
        Container(
          color: Colors.yellow,
        ),
        Container(
          color: Colors.green,
        ),
        Container(
          color: Colors.black,
        ),
      ],
      bottomTabs: bottomTabs,
    );
  }
}
