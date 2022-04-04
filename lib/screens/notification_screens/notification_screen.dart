import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/common_padding.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/widgets/text_views.dart';


class NotificationScreen extends StatefulWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar:
          _customAppBar(context: context),
      key: scaffoldKey,
      body: SizedBox(
        height: sizes!.height,
        width: sizes!.width,
        child: Column(
          children: [
            // CommonWidgets.getAppBarWithSimpleDesignAndText(
            //   context: context,
            //   title: "Notifications",
            // ),
            SizedBox(
              height: sizes!.heightRatio! *10.0,
            ),
            Expanded(
                child: Padding(
              padding: EdgeInsets.only(
                  left: sizes!.widthRatio * 30, right: sizes!.widthRatio! * 30),
              child: ListView.builder(
                  itemCount: 12,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        _getNotificationCardWithoutContainer(),
                        // SizedBox(
                        //   height: sizes!.heightRatio * 2.0,
                        // ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: sizes!.widthRatio! * 5.0,
                              right: sizes!.widthRatio! * 5.0),
                          child:  Divider(
                            color: AppColors.pmOpeningHourTextColor,
                          ),
                        ),
                      ],
                    );
                  }),
            )),
          ],
        ),
      ),
    ));
  }

  AppBar _customAppBar({
    required BuildContext context,
  }) {
    return AppBar(

      toolbarHeight: sizes!.heightRatio * 60.0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding:  EdgeInsets.only(left: sizes!.widthRatio * 30.0),
        child: TextView.getMediumText18("Notifications", Assets.poppinsRegular,
            color: AppColors.black, lines: 1),
      ),
      elevation: 0,
      // leading: Padding(
      //   padding: EdgeInsets.only(left: sizes!.widthRatio * 30),
      //   child: Image.asset(
      //     "assets/png/menu_logo_icon@2x.png",
      //     height: sizes!.heightRatio * 30.0,
      //     width: sizes!.widthRatio * 30.0,
      //   ),
      // ),
      backgroundColor: AppColors.white,
      // foregroundColor: AppColors.black,
      // shadowColor: AppColors.blue,
      // actions: [
      //   Padding(
      //     padding: EdgeInsets.only(right: sizes!.widthRatio * 30),
      //     child: GestureDetector(
      //       onTap: () {
      //         Navigator.push(
      //             context, SlideRightRoute(page: const ScannerScreen()));
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

  Widget _getNotificationCardWithoutContainer() {
    return Padding(
      padding: EdgeInsets.only(
          top: sizes!.heightRatio * 5.0, bottom: sizes!.heightRatio * 5.0),
      child: Row(
        children: [
          Image.asset(
            Assets.notificationLogo,
            height: sizes!.heightRatio * 42.0,
            width: sizes!.widthRatio * 42.0,
          ),
          SizedBox(
            width: sizes!.widthRatio * 10.0,
          ),
          Row(
            children: [
              TextView.getRegular13Text("Shop and Win!", Assets.poppinsMedium,
                  color: AppColors.notificationTextColor, lines: 1),
              CommonPadding.sizeBoxWithWidth(width: 100.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: sizes!.heightRatio * 6,
                    width: sizes!.widthRatio * 6,
                    decoration:  BoxDecoration(
                        color: AppColors.blue,
                        borderRadius: BorderRadius.all(const Radius.circular(6))),
                  ),
                  CommonPadding.sizeBoxWithHeight(height: 10.0),
                  TextView.getSmallText12("12:30 AM", Assets.poppinsRegular,
                      color: AppColors.notificationTextColor, lines: 1),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
