import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoicmlkZXIxMjNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiRW1wbG95ZXIiLCJleHAiOjE2NDk4MzI3OTEsImlzcyI6IlBhY2thZ2VzQVBJIn0.rPZyN7y3F2Hz-DI0Mkd2ACWDbiTkHktPSedapyxM-zw","user":{"id":"8e5c571b-7304-4f87-8ee0-3854c76a3f3e","profilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png","fullName":"Employer","phoneNumber":"9898988989","email":"rider123@gmail.com","password":"@Dmin123"}}

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));
String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());
class LoginResponse {
  LoginResponse({
      this.message, 
      this.code, 
      this.data,});

  LoginResponse.fromJson(dynamic json) {
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

/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1lIjoicmlkZXIxMjNAZ21haWwuY29tIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiRW1wbG95ZXIiLCJleHAiOjE2NDk4MzI3OTEsImlzcyI6IlBhY2thZ2VzQVBJIn0.rPZyN7y3F2Hz-DI0Mkd2ACWDbiTkHktPSedapyxM-zw"
/// user : {"id":"8e5c571b-7304-4f87-8ee0-3854c76a3f3e","profilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png","fullName":"Employer","phoneNumber":"9898988989","email":"rider123@gmail.com","password":"@Dmin123"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.token, 
      this.user,});

  Data.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }

}

/// id : "8e5c571b-7304-4f87-8ee0-3854c76a3f3e"
/// profilePicPath : "https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics//dummy_profile.png"
/// fullName : "Employer"
/// phoneNumber : "9898988989"
/// email : "rider123@gmail.com"
/// password : "@Dmin123"

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