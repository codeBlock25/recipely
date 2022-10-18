part of authentication_ui;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  late AnimationController _animationController;
  final _animationSpeed = .5;
  final _animationDistance = 10.sp;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
      animationBehavior: AnimationBehavior.normal,
      reverseDuration: const Duration(milliseconds: 3000),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: 20.sp,
        ),
        Row(mainAxisSize: MainAxisSize.min, children: <Widget>[
          RichText(
            text: TextSpan(
              text: "Don't have an account ",
              children: [
                TextSpan(
                    text: 'Register',
                    style: Theme.of(context).textTheme.headline6,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (Get.previousRoute ==
                            const RegisterScreen().createConfig().path) {
                          const RegisterScreen().popThenTo(
                              const StoryBoard().createConfig().path);
                        }
                        const RegisterScreen().goto();
                      }),
              ],
              style: Theme.of(context).textTheme.bodyText2,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            width: 15.sp,
            height: 15.sp,
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: <Widget>[
                AnimatedBuilder(
                    animation: _animationController,
                    builder: (BuildContext context, Widget? child) {
                      return AnimatedPositioned(
                        duration: const Duration(milliseconds: 50),
                        curve: Curves.bounceInOut,
                        left: _animationController.value <= _animationSpeed
                            ? _animationController.value * _animationDistance
                            : ((_animationSpeed * _animationController.value) -
                                    (_animationController.value -
                                        _animationSpeed)) *
                                _animationDistance,
                        child: child ?? const SizedBox(),
                      );
                    },
                    child: SizedBox(
                      child: Icon(
                        UniconsLine.arrow_right,
                        color: Theme.of(context).textTheme.headline6?.color,
                        size: Theme.of(context).textTheme.headline4?.fontSize,
                      ),
                    ))
              ],
            ),
          ),
        ]),
        AppTextField(
          label: 'Email Address',
          placeholder: 'Enter Email Address',
          textController: _emailTextController,
          icon: UniconsLine.envelope,
        ),
        AppTextField(
          label: 'Password',
          placeholder: 'Enter Password',
          textController: _passwordTextController,
          icon: UniconsLine.lock,
        ),
        SizedBox(
          height: 30.sp,
        ),
        TextButton(
          onPressed: () {
            const RecipeCategoryPickerScreen().goto();
          },
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
              Size(100.w, 50.sp),
            ),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.sp),
              ),
            ),
          ),
          child: Text(
            'Continue',
            style: Theme.of(context)
                .textTheme
                .headline5
                ?.copyWith(color: Colors.white),
          ),
        ),
        SizedBox(
          height: 20.sp,
        ),
        Align(
          child: Text(
            'By continuing, you agree to the',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Align(
          child: RichText(
            text: TextSpan(
              text: 'Terms of Services',
              children: [
                TextSpan(
                  text: ' & ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      ?.copyWith(color: Colors.grey),
                ),
                const TextSpan(text: 'Privacy Policy')
              ],
              style: Theme.of(context).textTheme.headline6,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 50.sp,
        ),
      ],
    );
  }
}
