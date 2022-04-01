import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';

class LoginScreenComponents {
  Widget welcomeText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Welcome Back!",
        maxLines: 1,
        style: TextStyle(
          fontSize: sizes.authFontSize,      
          fontFamily: Assets.poppinsBold,
          fontWeight: FontWeight.bold,
          color: AppColors.lightBlack,
        ),
      ),
    );
  }

  Widget subtitleText() {
    return Text(
      "Please enter valid credentials to continue the process.",
      maxLines: 2,
      style: TextStyle(
        fontSize: sizes.regularFontSize,      
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.w600,
        color: AppColors.lightBlack,
      ),
    );
  }

  Widget forgotPasswordTextButton({required option}) {
    return GestureDetector(
      child: Align(
        alignment: Alignment.centerRight,
        child: Text(
          "Forgot Password?",
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: sizes.smallFontSize,
              fontFamily: Assets.poppinsRegular,
              color: AppColors.borderColor),
        ),
      ),
      onTap: option,
    );
  }

}