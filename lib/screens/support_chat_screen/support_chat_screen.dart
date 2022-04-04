import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';
import 'package:packages_mall_employer/widgets/text_views.dart';

class SupportChatScreen extends StatefulWidget {
  const SupportChatScreen({Key? key}) : super(key: key);

  @override
  State<SupportChatScreen> createState() => _SupportChatScreenState();
}

class _SupportChatScreenState extends State<SupportChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _customAppBar(context: context),
      body: Container(
        height: sizes!.height,
        width: sizes!.width,
        padding: EdgeInsets.only(
            top: getHeightRatio() * 30,
            left: sizes!.widthRatio * 30,
            right: sizes!.widthRatio! * 30),
        child: Column(
          children: [
            searchBar(),
            SizedBox(
              height: getHeightRatio() * 15,
            ),
            CommonWidgets.supportMessageTextFieldContainer(
                placeHolder: "Your Message*",
                startIcon: Assets.messageIcon,
                endIcon: Assets.messageIcon,
                onStartIconPress: () {},
                onEndIconPress: () {},
                keyboardType: TextInputType.text),
          Spacer(),
        CommonWidgets.mainButton(text: "Send", onPress: (){
          Navigator.pop(context);},
        ),
            SizedBox(
              height: getHeightRatio() * 30,
            ),
          ],

        ),
      ),
    );
  }

  AppBar _customAppBar({
    required BuildContext context,
  }) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: sizes!.heightRatio * 50.0,
      title: Padding(
          padding: EdgeInsets.only(left: sizes!.widthRatio * 10.0),
          child: Row(
            children: [
              Container(
                  width: getWidthRatio() * 30,
                  height: getHeightRatio() * 30,
                  padding: EdgeInsets.all(getHeightRatio() * 8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: AppColors.pmOpeningHourTextColor,
                        width: 0.3,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  child: GestureDetector(
                    onTap:(){
                      Navigator.pop(context);
                    },

                      child: Image.asset(Assets.backArrowIcon))),
              SizedBox(
                width: getWidthRatio() * 15,
              ),
              TextView.getMediumText18("Support", Assets.poppinsMedium,
                  color: AppColors.black, lines: 1),

            ],
          )),
      // leading: Padding(
      //   padding: EdgeInsets.only(left: sizes!.widthRatio * 30),
      //   child: Image.asset(
      //     "assets/png/menu_logo_icon@2x.png",
      //     height: sizes!.heightRatio * 30.0,
      //     width: sizes!.widthRatio * 30.0,
      //   ),
      // ),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      shadowColor: AppColors.cardShadowColor,
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: sizes!.widthRatio * 30),
      //     child: GestureDetector(
      //       onTap: () {
      //         // Navigator.push(
      //         //     context, SlideRightRoute(page: const ScannerScreen()));
      //       },
      //       child: Image.asset(
      //         "assets/png/qr_scanner_icon.png",
      //         height: sizes!.heightRatio * 35.0,
      //         width: sizes!.widthRatio * 35.0,
      //       ),
      //     ),
      //   )
      // ],
    );
  }

  Widget searchBar() {
    return Padding(
      padding: EdgeInsets.only(
          left: sizes!.widthRatio * 0, right: sizes!.widthRatio * 0),
      child: CommonWidgets.homeSearchBarWithDoubleIcons(
        placeHolder: "Subject",
        startIcon: Assets.subjectIcon,
        endIcon: "assets/png/filter_icon@2x.png",
        keyboardType: TextInputType.text,
        onStartIconPress: () {},
        onEndIconPress: () {},
      ),
    );
  }
}
