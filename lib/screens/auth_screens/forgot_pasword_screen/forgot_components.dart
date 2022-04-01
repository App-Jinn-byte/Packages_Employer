import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';

class ForgotScreenComponents {
  Widget welcomeText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Forgot Password",
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
      "Enter you Email address and we will share a link at your Email.",
      maxLines: 2,
      style: TextStyle(
        fontSize: sizes.regularFontSize,      
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.w500,
        color: AppColors.lightBlack,
      ),
    );
  }


  //
}