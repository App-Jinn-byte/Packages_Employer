import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
class CommonWidgets {


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
}