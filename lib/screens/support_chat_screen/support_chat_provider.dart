import 'package:flutter/material.dart';
import 'package:packages_mall_employer/models/profile_module/ChatSupportResponse.dart';
import 'package:packages_mall_employer/network/API.dart';
import 'package:packages_mall_employer/network/api_url.dart';
import 'package:packages_mall_employer/network/models.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/strings.dart';
import 'package:packages_mall_employer/res/utils.dart';
import 'package:packages_mall_employer/widgets/loader.dart';

class SupportChatProvider extends ChangeNotifier {


  BuildContext? context;
  bool isDataFetched = false;
  final Loader _loader= Loader();

  ChatSupportResponse chatSupportResponse= ChatSupportResponse();

  Future<void> init({@required BuildContext? context}) async {
    isDataFetched = false;
    this.context = context;
  }

  Future<void> supportChatAPi({@required String? description,}) async {
    try {
      String userId = PreferenceUtils.getString(Strings.loginUserId) ?? '';
      _loader.showLoader(context: context);

      Map<String, dynamic> header = {"Content-Type": "application/json"};

      Map<String, dynamic> body = {
        "Subject" : "Issue02",
        "Message" : description,
        "UserId" : userId
      };

      chatSupportResponse = await Api.callPostApi(
          url: chatSupportApiUrl,
          body: body,
          myHeaders: header,
          modelName: Models.chatSupportModel);

      if (chatSupportResponse.code==1) {
        debugPrint('Query Posted');
        _loader.hideLoader(context: context!);
        Toasts.getSuccessToast(heading:'Query Posted' );
        Navigator.pop(context!);
      } else {
        _loader.hideLoader(context: context!);
      }
    } catch (e) {
      _loader.hideLoader(context: context!);
      debugPrint(e.toString());
    }
  }


}