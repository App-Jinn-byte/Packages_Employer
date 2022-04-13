import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"message":"New password has been sent on your email."}

ForgotPasswordResponse forgotPasswordResponseFromJson(String str) => ForgotPasswordResponse.fromJson(json.decode(str));
String forgotPasswordResponseToJson(ForgotPasswordResponse data) => json.encode(data.toJson());
class ForgotPasswordResponse {
  ForgotPasswordResponse({
      this.message, 
      this.code, 
      this.data,});

  ForgotPasswordResponse.fromJson(dynamic json) {
    message = json['message'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? message;
  int? code;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['code'] = code;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

/// message : "New password has been sent on your email."

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.message,});

  Data.fromJson(dynamic json) {
    message = json['message'];
  }
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    return map;
  }

}