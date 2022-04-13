import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/bg_circle.png"}

UploadProfilePictureResponse uploadProfilePictureResponseFromJson(String str) => UploadProfilePictureResponse.fromJson(json.decode(str));
String uploadProfilePictureResponseToJson(UploadProfilePictureResponse data) => json.encode(data.toJson());
class UploadProfilePictureResponse {
  UploadProfilePictureResponse({
      this.message, 
      this.code, 
      this.data,});

  UploadProfilePictureResponse.fromJson(dynamic json) {
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

/// filePath : "https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/bg_circle.png"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.filePath,});

  Data.fromJson(dynamic json) {
    filePath = json['filePath'];
  }
  String? filePath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['filePath'] = filePath;
    return map;
  }

}