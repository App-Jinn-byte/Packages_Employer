import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_components.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_provider.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginProvider loginProvider;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  LoginScreenComponents loginScreenComponents = LoginScreenComponents();
  late bool isHiddenPassword = true;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();

    loginProvider = LoginProvider();
    loginProvider = Provider.of<LoginProvider>(context, listen: false);
    loginProvider.init(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    loginProvider = Provider.of<LoginProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: sizes.height,
        width: sizes.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.authBackground),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 30 * getWidthRatio()),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getHeightRatio() * 45),
              Center(
                child: Image.asset(
                  Assets.authLogo,
                  height: getHeightRatio() * 100,
                  width: getWidthRatio() * 145,
                ),
              ),
              //
              SizedBox(height: getHeightRatio() * 50),
              loginScreenComponents.welcomeText(),
              //
              SizedBox(height: getHeightRatio() * 10),
              loginScreenComponents.subtitleText(),
              //
              SizedBox(height: getHeightRatio() * 50),
              CommonWidgets.customTextField(
                placeHolder: "Email",
                icon: Icons.person,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customPasswordTextField(
                placeHolder: "Password",
                onClick: _togglePasswordView,
                hidePassword: isHiddenPassword,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
              ),
              //
              SizedBox(height: getHeightRatio() * 15),
              loginScreenComponents.forgotPasswordTextButton(
                option: () {
                  Navigator.pushNamed(context, Routes.forgotScreen);
                },
              ),
              //
              SizedBox(height: getHeightRatio() * 140),
              CommonWidgets.mainButton(
                  text: "Sign In",
                  onPress: () {
                    loginAPIRequest();
                    // Navigator.pushNamed(context, Routes.bottomTabScreen);
                  }),
              //
              SizedBox(height: getHeightRatio() * 25),
              CommonWidgets.customRowButton(
                firstText: "Don't have an account? ",
                colorText: "Sign Up",
                press: () {
                  Navigator.pushNamed(context, Routes.signUpScreen);
                },
              ),
              //
            ],
          ),
        ),
      )),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Future<void> loginAPIRequest() async {
    var password = passwordController.text.trim();
    var email = emailController.text;
    if (email.isEmpty) {
      Toasts.getErrorToast(heading: "Please Enter Your Email");
    } else if (email.validateEmail() == false) {
      Toasts.getErrorToast(heading: "Please Enter Valid Email");
    } else if (password.isEmpty) {
      Toasts.getErrorToast(heading: "Please Enter Your Password");
    } else {
      await loginProvider.loginUserApi(password: password, email: email);
    }
  }
}
