import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_components.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenComponents loginScreenComponents = LoginScreenComponents();
  late bool isHiddenPassword = true;
  @override
  Widget build(BuildContext context) {
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
          physics: const BouncingScrollPhysics(),
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
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customPasswordTextField(
                placeHolder: "Password",
                onClick: _togglePasswordView,
                hidePassword: isHiddenPassword,
                keyboardType: TextInputType.visiblePassword,
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
              CommonWidgets.mainButton(text: "Sign In", onPress: () {
                Navigator.pushNamed(context, Routes.bottomTabScreen);

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

}
