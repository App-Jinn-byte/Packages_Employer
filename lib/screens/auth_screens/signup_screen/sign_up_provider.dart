
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:packages_mall_employer/animations/slide_right.dart';
import 'package:packages_mall_employer/models/auth_models/SignUpResponse.dart';
import 'package:packages_mall_employer/models/auth_models/UploadProfilePictureResponse.dart';
import 'package:packages_mall_employer/network/API.dart';
import 'package:packages_mall_employer/network/api_url.dart';
import 'package:packages_mall_employer/network/models.dart';
import 'package:packages_mall_employer/res/my_toasts.dart';
import 'package:packages_mall_employer/res/strings.dart';
import 'package:packages_mall_employer/res/utils.dart';
import 'package:packages_mall_employer/screens/auth_screens/login_screen/login_screen.dart';
import 'package:packages_mall_employer/widgets/loader.dart';

class SignUpProvider extends ChangeNotifier {
  BuildContext? context;
  late bool isUploadImageSuccessful;
  final Loader _loader = Loader();

  File? photoFile;

  SignUpResponse signUpResponse = SignUpResponse();
  UploadProfilePictureResponse uploadPhotoResponse = UploadProfilePictureResponse();




  Future init({required BuildContext context}) async {
    this.context = context;
    isUploadImageSuccessful = false;
  }

  Future<bool> registerUserApi({
    required dynamic fullName,
    required dynamic email,
    required dynamic phoneNumber,
    required dynamic password,

  }) async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};
      Map<String, dynamic> body = {
        "profilePicture": PreferenceUtils.getString(Strings.photoUrl),
        "fullname": fullName,
        "email": email,
        "phoneNumber": phoneNumber,
        "password": password
      };

      debugPrint("SignUp URL: $signupApiUrl");

      signUpResponse = await Api.callPostApi(
        url: signupApiUrl,
        body: body,
        myHeaders: header,
        modelName: Models.signUpModel,
      );
      if (signUpResponse.code == 1) {
        debugPrint("signupResponse: ${signUpResponse.data!.toJson()}");
        Toasts.getSuccessToast(heading: 'Signup Successful');

        Navigator.pushReplacement(
            context!, SlideRightRoute(page: const LoginScreen()));
        notifyListeners();
      } else {
        debugPrint("signupResponse: Something wrong");
      }

      return true;
    } catch (e) {
      debugPrint("Catch-Error: ${e.toString()}");
      _loader.hideLoader(context: context!);
      return false;
    }
  }

  Future<void> uploadPhotoApi() async {
    try {
      _loader.showLoader(context: context);
      Map<String, dynamic> header = {"accept": "*/*"};
      String? filename = photoFile?.path.split('/').last;

      //body
      FormData formData = FormData.fromMap({
        "": await MultipartFile.fromFile(
          photoFile?.path ?? '',
          filename: filename,
        ),
      });

      debugPrint("Upload Resume URL: $uploadProfilePicApiUrl");
      uploadPhotoResponse = await Api.callPostApi(
        url: uploadProfilePicApiUrl,
        body: formData,
        myHeaders: header,
        modelName: Models.uploadProfilePicModel,
      );

      if (uploadPhotoResponse.code == 1) {
        isUploadImageSuccessful = true;
        String _url = uploadPhotoResponse.data!.filePath.toString();
        debugPrint("updated url >>>>>>>>$_url");
        _loader.hideLoader(context: context!);
        PreferenceUtils.setString(Strings.photoUrl, _url);
        Toasts.getSuccessToast(heading: "Profile Image Uploaded");
        // await updateImageApi();
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Photo Uploading Error: ${e.toString()}");
    }
  }
}
