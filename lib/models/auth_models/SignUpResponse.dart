import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"user":{"id":"efb557e7-70bc-4c8c-903d-2b4ddae8d221","profilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png","fullName":"Employer01","phoneNumber":"090078601","email":"employer@gmail111.com","password":"@Ser123"}}

SignUpResponse signUpResponseFromJson(String str) => SignUpResponse.fromJson(json.decode(str));
String signUpResponseToJson(SignUpResponse data) => json.encode(data.toJson());
class SignUpResponse {
  SignUpResponse({
      this.message, 
      this.code, 
      this.data,});

  SignUpResponse.fromJson(dynamic json) {
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

/// user : {"id":"efb557e7-70bc-4c8c-903d-2b4ddae8d221","profilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png","fullName":"Employer01","phoneNumber":"090078601","email":"employer@gmail111.com","password":"@Ser123"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.user,});

  Data.fromJson(dynamic json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// id : "efb557e7-70bc-4c8c-903d-2b4ddae8d221"
/// profilePicPath : "https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png"
/// fullName : "Employer01"
/// phoneNumber : "090078601"
/// email : "employer@gmail111.com"
/// password : "@Ser123"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());
class User {
  User({
      this.id, 
      this.profilePicPath, 
      this.fullName, 
      this.phoneNumber, 
      this.email, 
      this.password,});

  User.fromJson(dynamic json) {
    id = json['id'];
    profilePicPath = json['profilePicPath'];
    fullName = json['fullName'];
    phoneNumber = json['phoneNumber'];
    email = json['email'];
    password = json['password'];
  }
  String? id;
  String? profilePicPath;
  String? fullName;
  String? phoneNumber;
  String? email;
  String? password;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['profilePicPath'] = profilePicPath;
    map['fullName'] = fullName;
    map['phoneNumber'] = phoneNumber;
    map['email'] = email;
    map['password'] = password;
    return map;
  }

}