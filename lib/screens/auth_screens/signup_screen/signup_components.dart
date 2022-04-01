import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';

class SignUpScreenComponents {
  Widget welcomeText() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        "Sign Up",
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
      "If you are looking for shopping destination in Lahore.",
      maxLines: 2,
      style: TextStyle(
        fontSize: sizes.regularFontSize,
        fontFamily: Assets.poppinsRegular,
        fontWeight: FontWeight.w600,
        color: AppColors.lightBlack,
      ),
    );
  }

  Widget uploadDottedButton({
    required text,
    required onPress,
  }) {
    return GestureDetector(
      child: DottedBorder(
        color: AppColors.borderColor,
        dashPattern: const [6, 6],
        radius: const Radius.circular(12),
        borderType: BorderType.RRect,
        child: Container(
          width: getWidthRatio() * 315,
          height: getHeightRatio() * 44,
          child: Align(
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add_circle_sharp,
                    size: 20 * getHeightRatio(),
                    color: AppColors.blue,
                  ),
                  SizedBox(width: getWidthRatio() * 10),
                  CommonWidgets.customText(
                    text: text,
                    lines: 1,
                    fontSize: sizes.smallFontSize,
                    fontWeight: FontWeight.w500,
                    fontFamily: Assets.poppinsMedium,
                    color: AppColors.black.withOpacity(0.35),
                  ),
                ],
              )),
        ),
      ),
      onTap: onPress,
    );
  }
}
