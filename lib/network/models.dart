

import 'package:packages_mall_employer/models/auth_models/ForgotPasswordResponse.dart';
import 'package:packages_mall_employer/models/auth_models/LoginResponse.dart';
import 'package:packages_mall_employer/models/auth_models/SignUpResponse.dart';
import 'package:packages_mall_employer/models/auth_models/UploadProfilePictureResponse.dart';
import 'package:packages_mall_employer/models/errorResponseModel.dart';

class Models {
  static const String errorModel = "errorModel";
  static const String signUpModel = "signUpModel";
  static const String logInModel = "logInModel";
  static const String uploadProfilePicModel = "uploadProfilePicModel";
  static const String forgotPasswordModel = "forgotPasswordModel";


  static Future<dynamic> getModelObject(
      String modelName, Map<String, dynamic> json) async {
    switch (modelName) {
      case errorModel:
        return ErrorResponse.fromJson(json);
      case signUpModel:
        return SignUpResponse.fromJson(json);
      case logInModel:
        return LoginResponse.fromJson(json);
      case uploadProfilePicModel:
        return UploadProfilePictureResponse.fromJson(json);
      case forgotPasswordModel:
        return ForgotPasswordResponse.fromJson(json);
    }
  }
//
}
