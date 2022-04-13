import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/screens/auth_screens/signup_screen/sign_up_provider.dart';
import 'package:packages_mall_employer/screens/auth_screens/signup_screen/signup_components.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late SignUpProvider signUpProvider;
  late bool isHiddenPassword = true;

  late TextEditingController fullNameController;
  late TextEditingController emailController;
  late TextEditingController phoneNumberController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  ///Image Picker
  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    await picker
        .pickImage(
      source: ImageSource.gallery,
    )
        .then((value) {
      if (value != null) {
        signUpProvider.photoFile = File(value.path);
        print("Photo Path>>>>>>>>>>>${signUpProvider.photoFile}");
        signUpProvider.uploadPhotoApi();
      } else {
        Toasts.getErrorToast(heading: 'No Image selected');
        debugPrint('No image selected.');
      }
      setState(() {});

      return value;
    });
  }

  @override
  void initState() {
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    phoneNumberController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();

    signUpProvider = SignUpProvider();
    signUpProvider = Provider.of<SignUpProvider>(context, listen: false);
    signUpProvider.init(context: context);

    super.initState();
  }

  SignUpScreenComponents signUpScreenComponents = SignUpScreenComponents();

  @override
  Widget build(BuildContext context) {
    signUpProvider = Provider.of<SignUpProvider>(context, listen: true);
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
                child: SizedBox(
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
                controller: fullNameController,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customTextField(
                placeHolder: "Email",
                icon: Icons.phone_android,
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customTextField(
                placeHolder: "Phone number",
                icon: Icons.phone_android,
                keyboardType: TextInputType.number,
                controller: phoneNumberController,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              CommonWidgets.customPasswordTextField(
                placeHolder: "Password",
                controller: passwordController,
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
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
              ),
              //
              SizedBox(height: getHeightRatio() * 20),
              signUpScreenComponents.uploadDottedButton(
                text: "Upload Image",
                onPress: () async {

                  await pickImage();


                },
              ),
              //
              SizedBox(height: getHeightRatio() * 45),
              CommonWidgets.mainButton(
                  text: "Sign Up",
                  onPress: () async {
                    signUpAPIRequest();
                  }),
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

  Future<void> signUpAPIRequest() async {

    var password = passwordController.text.trim();
    var confirmPassword = confirmPasswordController.text.trim();
    var phoneNumber = phoneNumberController.text;
    var email = emailController.text;
    var fullName = fullNameController.text;
    if(fullName.isEmpty){
      Toasts.getErrorToast(heading: "Please Enter Your Full Name");
    }else if(email.isEmpty){
      Toasts.getErrorToast(heading: "Please Enter Your Email");
    }else if(email.validateEmail()==false){
      Toasts.getErrorToast(heading: "Please Enter Valid Email");
    }else if(phoneNumber.isEmpty){
      Toasts.getErrorToast(heading: "Please Enter Your Phone Number");

    }else if(password.isEmpty){
      Toasts.getErrorToast(heading: "Please Enter Your Password");

    }else if(confirmPassword.isEmpty){
      Toasts.getErrorToast(heading: "Please Enter Confirm Password");

    }else if(password != confirmPassword){
      Toasts.getErrorToast(heading: "Passwords don't match");

    }
    else {
      await signUpProvider.registerUserApi(
        password: password, phoneNumber: phoneNumber, email: email, fullName: fullName);
    }
  }
}
