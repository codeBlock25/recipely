part of authentication_ui;

class LoginScreen extends StatefulScreen {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();

  @override
  ScreenConfig createConfig() => ScreenConfig(
        title: "Welcome back to ${AppConfig.appName}",
        path: "/authentication/login",
        transition: Transition.rightToLeft,
      );
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 5.sp + MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        appBar: buildGenericAppBar(context, 'Login'),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Container(
            width: 100.w,
            height: 100.h,
            color: Theme.of(context).scaffoldBackgroundColor,
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: const SingleChildScrollView(
              child: LoginForm(),
            ),
          ),
        ),
      ),
    );
  }
}
