
import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/res/sizes.dart';

class WelcomeScreenComponents {
  Widget welcomeText() {
    return Text(
      "Welcome to Packages Mall",
      maxLines: 2,
      style: TextStyle(
        fontSize: sizes.titleFontSize,      
        fontFamily: Assets.poppinsBold,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
    );
  }

  Widget subtitleText() {
    return Text(
      "The Packages Mall is one of the best shopping mall in Lahore.",
      maxLines: 2,
      style: TextStyle(
        fontSize: sizes.regularFontSize,      
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      ),
    );
  }
}