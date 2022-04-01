
import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/sizes.dart';
import 'package:packages_mall_employer/res/utils.dart';

AppSizes sizes = AppSizes();

Future<void> initializeAppResources({@required context}) async {
  sizes.initializeSize(context);
  PreferenceUtils.init();
}

double getHeight() => sizes.height ?? 2560;

double getWidth() => sizes.width ?? 1440;

double getWidthRatio() => sizes.widthRatio ?? 1;

double getHeightRatio() => sizes.heightRatio ?? 1;

double commonWidth = getWidth() * .9;

double getFontRatio() => sizes.fontRatio ?? 1.0;

double driverLat = 0.0;
double driverLng = 0.0;

BuildContext? currentContext;

void setContext(BuildContext context) {
  currentContext = context;
}


extension StringExtensions on String {
  bool validateEmail() {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  bool validateCVV() {
    return RegExp(r'[0-9]{3}').hasMatch(this);
  }

  bool validatePassword() {
    return RegExp(
            r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(this);
  }

  String removeSpaces() {
    return replaceAll(' ', '');
  }
}

bool isPasswordCompliant(String password) {
  if (password.isEmpty) {
    return false;
  }

  bool hasUppercase = password.contains(RegExp(r'[A-Z]'));
  bool hasDigits = password.contains(RegExp(r'[0-9]'));
  bool hasLowercase = password.contains(RegExp(r'[a-z]'));
  bool hasSpecialCharacters =
      password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
  bool hasMinLength = password.length > 7;
  return hasDigits &
      hasUppercase &
      hasLowercase &
      hasSpecialCharacters &
      hasMinLength;
}
