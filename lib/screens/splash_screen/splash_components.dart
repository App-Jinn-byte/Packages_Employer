import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';

class SplashComponents {
  static Widget splashLayout() {
    return Container(
      height: sizes.height,
      width: sizes.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.splash),
          fit: BoxFit.fill,
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              Assets.packagesLogo,
              height: getHeightRatio() * 200,
              width: getWidthRatio() * 200,
            ),
          )
        ],
      ),
    );
  }
}