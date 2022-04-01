import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/screens/auth_screens/forgot_pasword_screen/forgot_components.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  ForgotScreenComponents forgotScreenComponents = ForgotScreenComponents();
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: getHeightRatio() * 30),
                CommonWidgets.backButton(onpress: () {
                  Navigator.pop(context);
                }),
                //
                SizedBox(height: getHeightRatio() * 100),
                forgotScreenComponents.welcomeText(),
                //
                SizedBox(height: getHeightRatio() * 10),
                Container(
                  width: getWidthRatio() * 250,
                  child: forgotScreenComponents.subtitleText(),
                ),
                //
                SizedBox(height: getHeightRatio() * 40),
                CommonWidgets.customTextField(
                  placeHolder: "Email",
                  icon: Icons.person,
                  keyboardType: TextInputType.emailAddress,
                ),
                //
                SizedBox(height: getHeightRatio() * 30),
                CommonWidgets.mainButton(text: "Submit", onPress: () {}),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}
