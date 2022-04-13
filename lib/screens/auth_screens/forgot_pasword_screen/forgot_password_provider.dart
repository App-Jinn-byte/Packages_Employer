import 'package:flutter/material.dart';
import 'package:packages_mall_employer/models/auth_models/ForgotPasswordResponse.dart';
import 'package:packages_mall_employer/network/API.dart';
import 'package:packages_mall_employer/network/api_url.dart';
import 'package:packages_mall_employer/network/models.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_screen.dart';
import 'package:packages_mall_employer/widgets/loader.dart';

class ForgotPasswordProvider extends ChangeNotifier {

  BuildContext? context;
  final Loader _loader = Loader();
  bool isForgotSuccessful = false;

  ForgotPasswordResponse forgotPasswordResponse = ForgotPasswordResponse();

  Future<void> init({@required BuildContext? context}) async {
    this.context = context;
    isForgotSuccessful = false;
  }

  Future<void> forgotPasswordApi({required String email}) async {
    try {
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "email": email,
      };

      debugPrint("URL: $forgotPasswordApiUrl");
      debugPrint("ForgotBody: $body");

      forgotPasswordResponse = await Api.callPostApi(
          url: forgotPasswordApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.forgotPasswordModel);

      if (forgotPasswordResponse.code == 1) {
        debugPrint(
            "forgotEmailResponse: ${forgotPasswordResponse.data!.toJson()}");
        isForgotSuccessful = true;
        Toasts.getSuccessToast(heading: forgotPasswordResponse.data?.message);
        _loader.hideLoader(context: context!);
        Navigator.push(
            context!,
            MaterialPageRoute(
                builder: (context) => const LoginScreen()));
        notifyListeners();
      } else {
        debugPrint("forgotEmailResponse: Something wrong");
      }
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
      _loader.hideLoader(context: context!);
    }
  }
}