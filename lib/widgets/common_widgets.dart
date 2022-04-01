import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';

class CommonWidgets {
  //text
  static Widget customText(
      {required String text,
      @required int? lines,
      @required double? fontSize,
      required FontWeight fontWeight,
      required fontFamily,
      required color}) {
    lines ??= 1;

    return Text(
      text,
      softWrap: true,
      overflow: TextOverflow.ellipsis,
      maxLines: lines,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
      ),
    );
  }

  //bluebutton
  static Widget mainButton({required text, required onPress}) {
    return Container(
      width: 315 * getWidthRatio(),
      height: 50 * getHeightRatio(),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: AppColors.blue,
            padding: EdgeInsets.symmetric(
                horizontal: getWidthRatio() * 30,
                vertical: getHeightRatio() * 10),
            elevation: 3.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            )),
        onPressed: () {
          onPress();
        },
        child: CommonWidgets.customText(
            text: text,
            lines: 1,
            fontSize: sizes.buttonFontSize,
            fontWeight: FontWeight.w500,
            fontFamily: Assets.poppinsMedium,
            color: AppColors.white),
      ),
    );
  }

  //textfield
  static Widget customTextField(
      {required placeHolder,
      required icon,
      @required TextEditingController? controller,
      required TextInputType keyboardType}) {
    return Container(
      width: getWidthRatio() * 315,
      height: getHeightRatio() * 50,
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: getHeightRatio() * 16,
                horizontal: getWidthRatio() * 16),
            hintText: placeHolder,
            hintStyle: TextStyle(
              color: AppColors.black.withOpacity(0.35),
              fontFamily: Assets.poppinsMedium,
              fontWeight: FontWeight.w500,
              fontSize: sizes.smallFontSize,
            ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Icon(
              icon,
              size: 20 * getHeightRatio(),
            ),
            prefixIconColor: AppColors.black.withOpacity(0.35),
          ),
        ),
      ),
    );
  }

  static Widget customPasswordTextField(
      {required placeHolder,
      required bool hidePassword,
      required VoidCallback onClick,
      @required TextEditingController? controller,
      required TextInputType keyboardType}) {
    return Container(
      width: getWidthRatio() * 315,
      height: getHeightRatio() * 50,
      child: Align(
        alignment: Alignment.center,
        child: TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: hidePassword,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            isDense: true,
            contentPadding: EdgeInsets.symmetric(
                vertical: getHeightRatio() * 16,
                horizontal: getWidthRatio() * 16),
            hintText: placeHolder,
            hintStyle: TextStyle(
              color: AppColors.black.withOpacity(0.35),
              fontFamily: Assets.poppinsMedium,
              fontWeight: FontWeight.w500,
              fontSize: sizes.smallFontSize,
            ),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.borderColor, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.blue, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            prefixIcon: Icon(
              Icons.lock,
              size: 20 * getHeightRatio(),
            ),
            suffixIcon: GestureDetector(
                onTap: onClick,
                child: Icon(
                  hidePassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.black.withOpacity(0.35),
                  size: 19,
                )),
          ),
        ),
      ),
    );
  }

  static Widget customRowButton(
      {required String firstText,
      required String colorText,
      @required Function? press}) {
    return TextButton(
      style: TextButton.styleFrom(),
      onPressed: () {
        if (press != null) {
          press.call();
        }
      },
      child: RichText(
        text: TextSpan(
          text: firstText,
          style: TextStyle(
            fontFamily: Assets.poppinsRegular,
            color: AppColors.black.withOpacity(0.60),
            fontSize: sizes.smallFontSize,
            fontWeight: FontWeight.w500,
          ),
          children: [
            TextSpan(
              text: colorText,
              style: TextStyle(
                color: AppColors.blue,
                fontFamily: Assets.poppinsBold,
                fontSize: sizes.smallFontSize,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget backButton({required onpress}) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 30 * getWidthRatio(),
        height: 30 * getHeightRatio(),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(7),
        ),
        padding: EdgeInsets.symmetric(
            vertical: getHeightRatio() * 2, horizontal: getWidthRatio() * 2),
        child: GestureDetector(
          child: Center(
            child: Icon(
              Icons.keyboard_arrow_left,
              size: 25 * getHeightRatio(),
            ),
          ),
          onTap: onpress,
        ),
      ),
    );
  }

  //
}
