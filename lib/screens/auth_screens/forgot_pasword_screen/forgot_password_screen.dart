import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/screens/auth_screens/forgot_pasword_screen/forgot_components.dart';
import 'package:packages_mall_employer/screens/auth_screens/forgot_pasword_screen/forgot_password_provider.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  late TextEditingController emailController;

  late ForgotPasswordProvider forgotPasswordProvider;

  late bool _isValidEmail;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();

    forgotPasswordProvider = ForgotPasswordProvider();
    forgotPasswordProvider = Provider.of<ForgotPasswordProvider>(context, listen: false);
    forgotPasswordProvider.init(context: context);

    // emailController.addListener(() async {
    //   _isValidEmail = emailController.text.validateForgotEmail();
    //   setState(() {
    //     if (_isValidEmail && emailController.text.isNotEmpty) {
    //       // emailIcon = Icons.check;
    //       // emailIconColor = AppColors.appTheme;
    //     } else {
    //       // emailIcon = Icons.clear;
    //       // emailIconColor = AppColors.redColor;
    //     }
    //   });
    // }
    // );
  }


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
                SizedBox(
                  width: getWidthRatio() * 250,
                  child: forgotScreenComponents.subtitleText(),
                ),
                //
                SizedBox(height: getHeightRatio() * 40),
                CommonWidgets.customTextField(
                  placeHolder: "Email",
                  icon: Icons.person,
                  keyboardType: TextInputType.emailAddress, controller: emailController,
                ),
                //
                SizedBox(height: getHeightRatio() * 30),
                CommonWidgets.mainButton(text: "Submit", onPress: () {

                  forgotPassword();
                }),

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> forgotPassword() async {
    var email = emailController.text.toString().trim();
    debugPrint("Email: $email");

    if (email.isEmpty) {

      Toasts.getErrorToast(heading:  "Empty Email.");
    } else if(email.validateEmail()== false) {
      Toasts.getErrorToast(heading:  "Invalid Email.");
    }else{
      await forgotPasswordProvider.forgotPasswordApi(email: email);
    }
    // if (forgotPasswordProvider.isForgotSuccessful == true) {
    //   Toasts.getSuccessToast( heading: "Email sent successfully");
    // }
  }
}

extension StringLoginExtensions on String {
  bool validateForgotEmail() {
    return RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  String removeSpaces() {
    return replaceAll(' ', '');
  }
}
