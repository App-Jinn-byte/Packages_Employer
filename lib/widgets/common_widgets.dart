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

  static Widget homeSearchBarWithDoubleIcons(
      {@required String? placeHolder,
        @required dynamic startIcon,
        @required dynamic endIcon,
        @required Function? onStartIconPress,
        @required Function? onEndIconPress,
        @required TextEditingController? controller,
        @required dynamic keyboardType}) {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 8, right: sizes!.widthRatio * 7),
      width: sizes!.widthRatio * 315,
      height: sizes!.heightRatio * 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.pmTextFieldBorderColor,
          //AppColors.textFieldBorderColor,
          width: 1,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.pmTextFieldBorderShadowColor,
            blurRadius: 32, //18
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: sizes!.widthRatio * 5,
            ),
            SizedBox(
              height: sizes!.heightRatio * 14.1,
              width: sizes!.widthRatio * 14.1,
              child: GestureDetector(
                  onTap: () {
                    if (onStartIconPress != null) {
                      onStartIconPress.call();
                    }
                  },
                  child: Image.asset(startIcon)),
            ),
            SizedBox(
              width: sizes!.widthRatio * 13.5,
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  readOnly: true,
                  obscureText: false,
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: placeHolder,
                    hintStyle:  TextStyle(
                        color: AppColors.pmOpeningHourTextColor,
                        fontFamily: Assets.poppinsRegular,
                        fontSize: 14),
                    contentPadding: EdgeInsets.only(
                        bottom: sizes!.heightRatio * 12,
                        top: sizes!.heightRatio * 12),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            // SizedBox(
            //   height: sizes!.heightRatio * 22,
            //   width: sizes!.widthRatio * 22,
            //   child: GestureDetector(
            //       onTap: () {
            //         if (onEndIconPress != null) {
            //           onEndIconPress.call();
            //         }
            //       },
            //       child: Image.asset(endIcon)),
            // ),
            SizedBox(
              width: sizes!.widthRatio * 6,
            ),
          ],
        ),
      ),
    );
  }

  static Widget supportMessageTextFieldContainer(
      {@required String? placeHolder,
        @required dynamic startIcon,
        @required dynamic endIcon,
        @required Function? onStartIconPress,
        @required Function? onEndIconPress,
        @required TextEditingController? controller,
        @required dynamic keyboardType}) {
    return Container(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 8, right: sizes!.widthRatio * 7),
      width: sizes!.widthRatio * 315,
      height: sizes!.heightRatio * 100,
      decoration: BoxDecoration(
        // border: Border.all(
        //   color: AppColors.pmTextFieldBorderColor,
        //   //AppColors.textFieldBorderColor,
        //   width: 1,
        // ),
        borderRadius: const BorderRadius.all(Radius.circular(6)),
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.pmTextFieldBorderShadowColor,
            blurRadius: 32, //18
            offset: Offset(0, 12),
          ),
        ],
      ),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          SizedBox(
            width: sizes!.widthRatio * 5,
          ),
          SizedBox(
            height: sizes!.heightRatio * 14.1,
            width: sizes!.widthRatio * 14.1,
            child: GestureDetector(
                onTap: () {
                  if (onStartIconPress != null) {
                    onStartIconPress.call();
                  }
                },
                child: Image.asset(startIcon)),
          ),
          SizedBox(
            width: sizes!.widthRatio * 13.5,
          ),
          Expanded(
            child: TextField(
              textAlignVertical: TextAlignVertical.center,
              obscureText: false,
              controller: controller,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                hintText: placeHolder,
                hintStyle:  TextStyle(
                    color: AppColors.pmOpeningHourTextColor,
                    fontFamily: Assets.poppinsRegular,
                    fontSize: 13),
                contentPadding: EdgeInsets.only(
                    bottom: sizes!.heightRatio * 12,
                    top: sizes!.heightRatio * 12),
                border: InputBorder.none,
              ),
            ),
          ),
          // SizedBox(
          //   height: sizes!.heightRatio * 22,
          //   width: sizes!.widthRatio * 22,
          //   child: GestureDetector(
          //       onTap: () {
          //         if (onEndIconPress != null) {
          //           onEndIconPress.call();
          //         }
          //       },
          //       child: Image.asset(endIcon)),
          // ),

        ],
      ),
    );
  }

  //
}

