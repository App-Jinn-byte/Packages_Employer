import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/common_padding.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/screens/home_screens/home_screen_components.dart';
import 'package:packages_mall_employer/screens/home_screens/home_screen_provider.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';
import 'package:packages_mall_employer/widgets/text_views.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeScreenProvider homeScreenProvider;

  @override
  void initState() {
    homeScreenProvider = HomeScreenProvider();
    homeScreenProvider =
        Provider.of<HomeScreenProvider>(context, listen: false);
    homeScreenProvider.init(context: context);
    homeScreenProvider.getNewsFeedAPi(homeScreenProvider.pageNumber);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    homeScreenProvider = Provider.of<HomeScreenProvider>(context, listen: true);
    return Scaffold(
      body: homeScreenProvider.newsFeedFetched ?
      homeScreenProvider
          .newsFeedResponse.data?.newsFeeds?.length != null ?

      SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(
              horizontal: getWidthRatio() * 30,
              vertical: getHeightRatio() * 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CommonPadding.sizeBoxWithHeight(height: 10.0),
              homeSearchBarWithDoubleIcons(
                  placeHolder: 'Search here',
                  endIcon: Assets.filterSearchIcon,
                  startIcon: Assets.homeSearchIcon,
                  onStartIconPress: () {},
                  keyboardType: null,
                  onEndIconPress: () {}),
              CommonPadding.sizeBoxWithHeight(height: 30.0),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: homeScreenProvider
                      .newsFeedResponse.data?.newsFeeds?.length ?? 1,
                  itemBuilder: (context, index) {
                    return HomeScreenComponents.newsFeedContainer(
                        profileImage: Assets.profileImage1,
                        name: homeScreenProvider.newsFeedResponse.data
                                ?.newsFeeds?[index].userFullName ??
                            'UserName',
                        description: homeScreenProvider.newsFeedResponse.data
                            ?.newsFeeds?[index].description ??
                            'Description',
                        date: homeScreenProvider.newsFeedResponse.data
                            ?.newsFeeds?[index].createdOn ??
                            'date');
                  })
            ],
          ),
        ),
      ):
      Center(
        child: CommonWidgets.customText(
          text: "News Feed is empty!",
          lines: 2,
          fontSize: getHeightRatio() * 20,
          fontFamily: Assets.poppinsRegular,
          color: AppColors.pmSearchBarTextColor, fontWeight: FontWeight.bold,
        ),
      ):Center(
        child: SizedBox(
          width: getWidthRatio() * 30,
          child: Lottie.asset(Assets.apiLoading),
        ),
      ),


      appBar: _customAppBar(context: context),
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
      width: sizes!.widthRatio * 325,
      height: sizes!.heightRatio * 45,
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
              height: sizes!.heightRatio * 13.1,
              width: sizes!.widthRatio * 13.1,
              child: GestureDetector(
                  onTap: () {
                    if (onStartIconPress != null) {
                      onStartIconPress.call();
                    }
                  },
                  child: Image.asset(startIcon)),
            ),
            SizedBox(
              width: sizes!.widthRatio * 5,
            ),
            Expanded(
              child: Center(
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  obscureText: false,
                  controller: controller,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    hintText: placeHolder,
                    hintStyle: TextStyle(
                        color: AppColors.notificationTextColor,
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
            SizedBox(
              height: sizes!.heightRatio * 22,
              width: sizes!.widthRatio * 22,
              child: GestureDetector(
                  onTap: () {
                    if (onEndIconPress != null) {
                      onEndIconPress.call();
                    }
                  },
                  child: Image.asset(endIcon)),
            ),
            SizedBox(
              width: sizes!.widthRatio * 6,
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
      toolbarHeight: sizes!.heightRatio * 60.0,
      title: Padding(
        padding: EdgeInsets.only(left: sizes!.widthRatio * 30.0),
        child: TextView.getMediumText18("Home", Assets.poppinsRegular,
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

      foregroundColor: AppColors.black,
      shadowColor: AppColors.cardShadowColor,
    );
  }
}
