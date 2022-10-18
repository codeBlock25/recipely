part of authentication_ui;

class RegisterScreen extends StatefulScreen {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

  @override
  ScreenConfig createConfig() => ScreenConfig(
        title: "Join ${AppConfig.appName}",
        path: "/authentication/register",
        transition: Transition.rightToLeft,
      );
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 5.sp + MediaQuery.of(context).padding.top,
      ),
      child: Scaffold(
        appBar: buildGenericAppBar(context, 'Register'),
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
              child: RegisterForm(),
            ),
          ),
        ),
      ),
    );
  }
}
