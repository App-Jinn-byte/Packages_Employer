import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/assets.dart';
import 'package:packages_mall_employer/res/colors.dart';
import 'package:packages_mall_employer/res/res.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/screens/welcome_screen/welcome_components.dart';
import 'package:packages_mall_employer/widgets/common_widgets.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  WelcomeScreenComponents welcomeScreenComponents = WelcomeScreenComponents();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: sizes.height,
          width: sizes.width,
          decoration: BoxDecoration(
            image: const DecorationImage(
              image: AssetImage(Assets.welcomeImage),
              fit: BoxFit.fill,
            ),
            color: AppColors.lightBlack,
          ),
          padding: EdgeInsets.symmetric(horizontal: 30 * getWidthRatio()),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  welcomeScreenComponents.welcomeText(),
                  SizedBox(height: getHeightRatio() * 10),
                  //
                  Container(
                    width: getWidthRatio() * 250,
                    child: welcomeScreenComponents.subtitleText(),
                  ),
                  SizedBox(height: getHeightRatio() * 45),
                  //
                  CommonWidgets.mainButton(
                    text: "Continue",
                    onPress: () {
                      Navigator.pushNamed(context, Routes.loginScreen);
                    },
                  ),
                  SizedBox(height: getHeightRatio() * 80),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
