import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/common_padding.dart';
import 'package:packages_mall_employer/res/res.dart';

class HomeScreenComponents {
  static Widget newsFeedContainer({
    required profileImage,
    required name,
    required date,
    required description,
  }) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              profileImage,
              // Assets.profileImage1,
              width: getWidthRatio() * 42,
              height: getHeightRatio() * 42,
            ),
            CommonPadding.sizeBoxWithWidth(width: 17),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontFamily: Assets.poppinsRegular,
                  ),
                ),
                Text(
                  DateFormat('hh:mm a').format(DateTime.parse(
                    date,
                  )),
                  style: TextStyle(
                      fontFamily: Assets.poppinsRegular,
                      color: AppColors.notificationTextColor),
                ),
              ],
            )
          ],
        ),
        CommonPadding.sizeBoxWithHeight(height: 16.0),
        Image.asset(Assets.homeScreenPic2),
        CommonPadding.sizeBoxWithHeight(height: 16.0),
        Align(
          alignment: Alignment.topLeft,
          child: Text(
            description,
            style: const TextStyle(
                fontFamily: Assets.poppinsRegular,
                color: AppColors.pmSearchBarTextColor),
          ),
        ),
        Divider(
          height: getHeightRatio() * 30,
        ),
      ],
    );
  }
}
