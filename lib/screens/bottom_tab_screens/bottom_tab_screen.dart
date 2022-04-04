import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/screens/home_screens/home_screen.dart';
import 'package:packages_mall_employer/screens/notification_screens/notification_screen.dart';
import 'package:packages_mall_employer/screens/profile_screens/profile_screen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomTabScreen extends StatefulWidget {
  const BottomTabScreen({Key? key}) : super(key: key);

  @override
  State<BottomTabScreen> createState() => _BottomTabScreenState();
}

class _BottomTabScreenState extends State<BottomTabScreen> {
  int _currentIndex = 0;
  List<Widget> tabs = [
    const HomeScreen(),
    Container(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: tabs[_currentIndex],
      ),
      bottomNavigationBar: SalomonBottomBar(
          selectedColorOpacity: 1,
          itemShape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),

          currentIndex: _currentIndex,
          onTap: (i) => setState(() => _currentIndex = i),
          items: [
            /// Home
            SalomonBottomBarItem(
              activeIcon: Image.asset(
                Assets.menuHomeIcon,
                color: AppColors.white,
                height: sizes!.heightRatio! * 17.25,
                width: sizes!.widthRatio! * 15.80,
              ),
              icon: Image.asset(
                Assets.menuHomeIcon,
                height: sizes!.heightRatio! * 17.25,
                width: sizes!.widthRatio! * 15.80,
              ),
              title: Text(
                "Home",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              selectedColor: AppColors.darkBlue,
            ),

            /// Search
            SalomonBottomBarItem(
              activeIcon: Image.asset(
                Assets.menuSearchIcon,
                color: AppColors.white,
                height: sizes!.heightRatio! * 20.96,
                width: sizes!.widthRatio! * 20.97,
              ),
              icon: Image.asset(
                Assets.menuSearchIcon,
                height: sizes!.heightRatio! * 20.96,
                width: sizes!.widthRatio! * 20.97,
              ),
              title: Text(
                "Search",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              selectedColor: AppColors.darkBlue,
            ),

            /// Notification
            SalomonBottomBarItem(
              activeIcon: Image.asset(
                Assets.menuNotificationIcon,
                color: AppColors.white,
                height: sizes!.heightRatio! * 17.41,
                width: sizes!.widthRatio! * 20.58,
              ),
              icon: Image.asset(
                Assets.menuNotificationIcon,
                height: sizes!.heightRatio! * 17.41,
                width: sizes!.widthRatio! * 20.58,
              ),
              title: Text(
                "Notifications",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              selectedColor: AppColors.darkBlue,
            ),

            /// Profile
            SalomonBottomBarItem(
              activeIcon: Image.asset(
                Assets.menuProfileIcon,
                color: AppColors.white,
                height: sizes!.heightRatio! * 18.04,
                width: sizes!.widthRatio! * 16.73,
              ),
              icon: Image.asset(
                Assets.menuProfileIcon,
                height: sizes!.heightRatio! * 18.04,
                width: sizes!.widthRatio! * 16.73,
              ),
              title: Text(
                "Profile",
                style: TextStyle(
                  color: AppColors.white,
                ),
              ),
              selectedColor: AppColors.darkBlue,
            ),
          ]),
    );
  }
}
