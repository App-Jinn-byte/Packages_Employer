import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/screens/auth_screens/signup_screen/signup_components.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late bool isHiddenPassword = true;
  SignUpScreenComponents signUpScreenComponents = SignUpScreenComponents();
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
              SizedBox(height: getHeightRatio() * 30),
              CommonWidgets.backButton(onpress: () {
                Navigator.pop(context);
              }),
              //
              SizedBox(height: getHeightRatio() * 40),
              signUpScreenComponents.welcomeText(),
              //
              SizedBox(height: getHeightRatio() * 10),
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: getWidthRatio() * 250,
                  child: signUpScreenComponents.subtitleText(),
                ),
              ),
              //
              SizedBox(height: getHeightRatio() * 25),
              CommonWidgets.customTextField(
                placeHolder: "Full name",
                icon: Icons.person,
                keyboardType: TextInputType.name,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customTextField(
                placeHolder: "Email",
                icon: Icons.phone_android,
                keyboardType: TextInputType.emailAddress,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customTextField(
                placeHolder: "Phone number",
                icon: Icons.phone_android,
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
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customPasswordTextField(
                placeHolder: "Confirm Password",
                onClick: _togglePasswordView,
                hidePassword: isHiddenPassword,
                keyboardType: TextInputType.visiblePassword,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              signUpScreenComponents.uploadDottedButton(
                text: "Upload Image",
                onPress: () {},
              ),
              //
              SizedBox(height: getHeightRatio() * 45),
              CommonWidgets.mainButton(text: "Sign Up", onPress: () {}),
              //
              SizedBox(height: getHeightRatio() * 25),
              CommonWidgets.customRowButton(
                firstText: "Already have an account? ",
                colorText: "Login",
                press: () {
                  Navigator.pushNamed(context, Routes.loginScreen);
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
