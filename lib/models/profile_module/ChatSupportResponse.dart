import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"supportId":4,"subject":"Issue02","message":"Issue02","userId":"cb3fcae9-3513-4ad2-a62c-2c1a96853945"}

ChatSupportResponse chatSupportResponseFromJson(String str) => ChatSupportResponse.fromJson(json.decode(str));
String chatSupportResponseToJson(ChatSupportResponse data) => json.encode(data.toJson());
class ChatSupportResponse {
  ChatSupportResponse({
      this.message, 
      this.code, 
      this.data,});

  ChatSupportResponse.fromJson(dynamic json) {
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

/// supportId : 4
/// subject : "Issue02"
/// message : "Issue02"
/// userId : "cb3fcae9-3513-4ad2-a62c-2c1a96853945"

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.supportId, 
      this.subject, 
      this.message, 
      this.userId,});

  Data.fromJson(dynamic json) {
    supportId = json['supportId'];
    subject = json['subject'];
    message = json['message'];
    userId = json['userId'];
  }
  int? supportId;
  String? subject;
  String? message;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['supportId'] = supportId;
    map['subject'] = subject;
    map['message'] = message;
    map['userId'] = userId;
    return map;
  }

}