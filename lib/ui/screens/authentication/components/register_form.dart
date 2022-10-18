part of authentication_ui;

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm>
    with SingleTickerProviderStateMixin {
  final TextEditingController _usernameTextController = TextEditingController();
  final TextEditingController _firstNameTextController =
      TextEditingController();
  final TextEditingController _lastNameTextController = TextEditingController();
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
              text: 'Already have an account ',
              children: [
                TextSpan(
                    text: 'Login',
                    style: Theme.of(context).textTheme.headline6,
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        if (Get.previousRoute ==
                            const LoginScreen().createConfig().path) {
                          const LoginScreen().popThenTo(
                              const StoryBoard().createConfig().path);
                        }
                        const LoginScreen().goto();
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
          label: 'username',
          placeholder: 'Your username',
          textController: _usernameTextController,
          icon: UniconsLine.user,
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              child: AppTextField(
                label: 'First Name',
                placeholder: 'First Name',
                textController: _firstNameTextController,
                icon: UniconsLine.user,
              ),
            ),
            SizedBox(
              width: 10.sp,
            ),
            Expanded(
              child: AppTextField(
                label: 'Last Name',
                placeholder: 'Last Name',
                textController: _lastNameTextController,
                icon: UniconsLine.user,
              ),
            ),
          ],
        ),
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

class AppTextField extends StatefulWidget {
  const AppTextField(
      {Key? key,
      required this.textController,
      required this.label,
      this.icon,
      required this.placeholder})
      : super(key: key);
  final String label;
  final String placeholder;
  final IconData? icon;
  final TextEditingController textController;
  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  @override
  Widget build(BuildContext context) {
    final label = widget.label;
    final placeholder = widget.placeholder;
    final icon = widget.icon;
    final textController = widget.textController;
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(bottom: 10.sp, top: 15.sp),
            child: Text(
              label.capitalizeFirst ?? '',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          TextFormField(
            controller: textController,
            cursorColor: AppTheme.appColor.dark,
            style: Theme.of(context).textTheme.bodyText1,
            decoration: InputDecoration(
              hintText: placeholder,
              hintStyle: Theme.of(context)
                  .inputDecorationTheme
                  .hintStyle
                  ?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize:
                          Theme.of(context).textTheme.bodyText1?.fontSize),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 12.sp, horizontal: 10.sp)
                      .copyWith(left: 0.sp),
              alignLabelWithHint: false,
              prefixIcon: icon is IconData
                  ? Icon(
                      icon,
                      size: Theme.of(context).textTheme.headline4?.fontSize,
                      color: AppTheme.appColor.dark,
                      shadows: [
                        Shadow(color: AppTheme.appColor.dark, blurRadius: 30.sp)
                      ],
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
