import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/common_padding.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/widgets/text_views.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late bool isImageUrl;

  @override
  void initState() {
    super.initState();
    // profileProvider = ProfileProvider();
    // profileProvider = Provider.of<ProfileProvider>(context, listen: false);
    // profileProvider.init(context: context);
    // profileProvider.getUserVehicleData(userID: _userID);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: _customAppBar(context: context),
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            children: [
              CommonPadding.sizeBoxWithHeight(height: 25.0),
              userProfileContainer(),
              CommonPadding.sizeBoxWithHeight(height: 38.0),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //     context, SlideRightRoute(page: const ContactScreen()));
                },
                child: customServiceContainer(
                    icon: Assets.timingIcon,
                    text: "Timings",
                    iconHeight: 18.05,
                    iconWidth: 18.05),
              ),
              CommonPadding.sizeBoxWithHeight(height: 15.0),
              GestureDetector(
                onTap: () {
                 Navigator.pushNamed(context, Routes.supportChatScreen);
                },
                child: customServiceContainer(
                    icon: Assets.supportChatIcon,
                    text: "Support Chat",
                    iconHeight: 16.54,
                    iconWidth: 18.05),
              ),
              CommonPadding.sizeBoxWithHeight(height: 15.0),
              GestureDetector(
                  onTap: () async {
                    // await logout();
                  },
                  child: customLogoutContainer(
                      icon: "assets/png/logout_icon.png", text: "Logout")),
              CommonPadding.sizeBoxWithHeight(height: 15.0),
            ],
          ),
        ),
      ),
    ));
  }

  AppBar _customAppBar({
    required BuildContext context,
  }) {
    return AppBar(
      toolbarHeight: sizes!.heightRatio * 60.0,
      elevation: 0,
      title: Padding(
        padding: EdgeInsets.only(left: sizes!.widthRatio * 30.0),
        child: TextView.getMediumText18("Profile", Assets.poppinsMedium,
            color: AppColors.black, lines: 1),
      ),
      backgroundColor: AppColors.white,
      foregroundColor: AppColors.black,
      shadowColor: AppColors.blue,
      actions: [
        Padding(
          padding: EdgeInsets.only(right: sizes!.widthRatio * 30),
          child: GestureDetector(
            onTap: () {
              // Navigator.push(
              //     context, SlideRightRoute(page: const EditProfileScreen()));
            },
            child: Image.asset(
              "assets/png/edit_icon.png",
              height: sizes!.heightRatio * 32.0,
              width: sizes!.widthRatio * 32.0,
            ),
          ),
        )
      ],
    );
  }

  Widget customServiceContainer({
    required dynamic icon,
    required String text,
    required double iconHeight,
    required double iconWidth,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 30),
      child: Container(
        height: sizes!.heightRatio * 54.0,
        width: sizes!.widthRatio * 316.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.pmOpeningHourTextColor,
              blurRadius: 18,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: sizes!.widthRatio * 20.0, right: sizes!.widthRatio * 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon ?? Assets.menuHomeIcon,
                    height: sizes!.heightRatio * iconHeight,
                    width: sizes!.widthRatio * iconWidth,
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 20.0),
                  TextView.getMediumText16(text, Assets.poppinsRegular,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      lines: 1),
                ],
              ),
              Image.asset(
                Assets.forwardIcon,
                width: sizes!.widthRatio * 8.12,
                height: sizes!.heightRatio * 13.8,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget customLogoutContainer({required dynamic icon, required String text}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizes!.widthRatio * 30),
      child: Container(
        height: sizes!.heightRatio * 54.0,
        width: sizes!.widthRatio * 316.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(6)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.pmOpeningHourTextColor,
              blurRadius: 18,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.only(
              left: sizes!.widthRatio * 20.0, right: sizes!.widthRatio * 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    icon ?? Assets.menuHomeIcon,
                    height: sizes!.heightRatio * 18.5,
                    width: sizes!.widthRatio * 18.5,
                  ),
                  CommonPadding.sizeBoxWithWidth(width: 20.0),
                  TextView.getMediumText16(text, Assets.poppinsRegular,
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
                      lines: 1),
                ],
              ),
              // Image.asset(
              //   "assets/png/left_arrow_icon@2x.png",
              //   width: sizes!.widthRatio * 8.12,
              //   height: sizes!.heightRatio * 13.8,
              // )
            ],
          ),
        ),
      ),
    );
  }

  Widget userProfileContainer() {
    return Container(
      height: sizes!.heightRatio * 142.0,
      width: sizes!.widthRatio * 316.0,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: AppColors.white,
        gradient: const LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomLeft,
          colors: [
            AppColors.pmLinearColorOne,
            AppColors.pmLinearColorTwo,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.pmOpeningHourTextColor,
            blurRadius: 18,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.only(
            left: sizes!.widthRatio * 10.0, right: sizes!.widthRatio * 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/png/Profile Photo-icon@2x.png",
                  height: sizes!.heightRatio * 90.0,
                  width: sizes!.widthRatio * 90.0,
                ),
                CommonPadding.sizeBoxWithWidth(width: 15.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextView.getWelcomeTextWith28(
                        "Alan Gilbert", Assets.poppinsBold,
                        color: AppColors.white, lines: 1),
                    TextView.getRegular13Text(
                        "John Doe.ellis@gmail.com", Assets.poppinsRegular,
                        color: AppColors.white, lines: 1),
                    TextView.getRegular13Text(
                        "+92-32-605-0330", Assets.poppinsRegular,
                        color: AppColors.white, lines: 1)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

// Future<void> logout() async {
//   PreferenceUtils.clearPreferences();
//   Navigator.pushReplacement(
//       context, SlideRightRoute(page: const LoginScreen()));
//   // const MyApp().restartApp(context: context);
// }

// Future<void> editVehicle() async {
//   debugPrint(
//       "VehicleID: ${profileProvider.getUserVehicleResponse.data!.last.vehicleId}");
//   Navigator.push(
//           context,
//           SlideRightRoute(
//               page: EditVehicleScreen(
//                   vehicleId: profileProvider
//                       .getUserVehicleResponse.data!.last.vehicleId,
//                   make:
//                       profileProvider.getUserVehicleResponse.data!.last.make,
//                   model:
//                       profileProvider.getUserVehicleResponse.data!.last.model,
//                   transmission: profileProvider.getUserVehicleResponse.data!
//                       .last.transmissionTypeTitle,
//                   plateNumber: profileProvider
//                       .getUserVehicleResponse.data!.last.licensePlateNumber)))
//       .then((_) {
//     profileProvider.getUserVehicleData(userID: _userID);
//   });
// }
//
// Future<void> deleteVehicle({required dynamic vehicleId}) async {
//   await profileProvider.deleteVehicleById(vehicleId: vehicleId);
//   if (profileProvider.isVehicleDeleted == true) {
//     Toasts.getSuccessToast(text: "Vehicle Deleted.");
//   }
// }

// Future<void> goToEditProfileScreen() async {
//   Navigator.push(context, SlideRightRoute(page: const EditProfileScreen()))
//       .then((_) {
//     profileProvider.getUserVehicleData(userID: _userID);
//     profileProvider.getUserDataFromStorage();
//   });
// }
}
