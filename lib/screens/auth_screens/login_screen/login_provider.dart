import 'package:flutter/material.dart';
import 'package:packages_mall_employer/models/auth_models/LoginResponse.dart';
import 'package:packages_mall_employer/network/API.dart';
import 'package:packages_mall_employer/network/api_url.dart';
import 'package:packages_mall_employer/network/models.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/strings.dart';
import 'package:packages_mall_employer/res/utils.dart';
import 'package:packages_mall_employer/routes/routes.dart';
import 'package:packages_mall_employer/widgets/loader.dart';

class LoginProvider extends ChangeNotifier {
  BuildContext? context;
  final Loader _loader = Loader();

  LoginResponse loginResponse = LoginResponse();

  init({BuildContext? context}) {
    this.context = context;
  }

  Future<void> loginUserApi(
      {required String email, required String password}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "Email": email,
        "Password": password,
        "DeviceId": 12345
      };

      debugPrint("URL: $loginApiUrl");

      loginResponse = await Api.callPostApi(
          url: loginApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.logInModel);

      if (loginResponse.code == 1) {
        // saving user id in local storage
        PreferenceUtils.setString(
            Strings.loginUserId, loginResponse.data?.user?.id ?? '');
        // PreferenceUtils.setString(
        //     Strings.email, loginResponse.data?.user?.email ?? '');
        // PreferenceUtils.setString(
        //     Strings.firstName, loginResponse.data?.user?.firstName ?? '');
        // PreferenceUtils.setString(
        //     Strings.lastName, loginResponse.data?.user?.lastName ?? '');
        // PreferenceUtils.setString(
        //     Strings.phoneNum, loginResponse.data?.user?.phoneNumber ?? '');

        debugPrint("loginResponse: ${loginResponse.data!.toJson()}");
        Toasts.getSuccessToast(heading: 'Login Successful');
        _loader.hideLoader(context: context!);
        // Navigator.pushReplacement(
        //     context!, SlideRightRoute(page: const BottomTabScreen()));
        Navigator.pushNamedAndRemoveUntil(
            context!, Routes.bottomTabScreen, (Route<dynamic> route) => false);
        notifyListeners();
      } else {
        debugPrint("loginResponse: Something wrong");
      }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
      _loader.hideLoader(context: context!);
    }
  }
}
