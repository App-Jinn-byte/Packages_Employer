import 'dart:convert';
/// message : "Operation performed successfully"
/// code : 1
/// data : {"newsFeeds":[{"newsFeedId":3,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 03","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:27:01.5957682","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"},{"newsFeedId":2,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 02","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:26:56.5125081","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"},{"newsFeedId":1,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 01","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:25:24.2820206","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"}],"total":3}

NewsFeedResponse newsFeedResponseFromJson(String str) => NewsFeedResponse.fromJson(json.decode(str));
String newsFeedResponseToJson(NewsFeedResponse data) => json.encode(data.toJson());
class NewsFeedResponse {
  NewsFeedResponse({
      this.message, 
      this.code, 
      this.data,});

  NewsFeedResponse.fromJson(dynamic json) {
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

/// newsFeeds : [{"newsFeedId":3,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 03","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:27:01.5957682","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"},{"newsFeedId":2,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 02","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:26:56.5125081","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"},{"newsFeedId":1,"filePath":"https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg","title":"Announcement 01","description":"Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus.","createdOn":"2022-04-14T05:25:24.2820206","userFullName":"John Doe 2","userProfilePicPath":"https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"}]
/// total : 3

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
      this.newsFeeds, 
      this.total,});

  Data.fromJson(dynamic json) {
    if (json['newsFeeds'] != null) {
      newsFeeds = [];
      json['newsFeeds'].forEach((v) {
        newsFeeds?.add(NewsFeeds.fromJson(v));
      });
    }
    total = json['total'];
  }
  List<NewsFeeds>? newsFeeds;
  int? total;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (newsFeeds != null) {
      map['newsFeeds'] = newsFeeds?.map((v) => v.toJson()).toList();
    }
    map['total'] = total;
    return map;
  }

}

/// newsFeedId : 3
/// filePath : "https://packagesapi.jinnbytedev.com/UploadedFiles/NewsFeedPics/WhatsApp Image 2022-01-26 at 8.23.15 PM.jpeg"
/// title : "Announcement 03"
/// description : "Morbi lacinia orci lorem, eget malesuada enim malesuada vel. Nam fringilla pharetra lacus nec mattis. Nunc fermentum urna quis blandit consectetur. Maecenas metus quam, dignissim lacinia tortor vel, convallis tincidunt enim. Etiam accumsan porta consequat. Cras nibh lorem, mattis ac tincidunt non, sagittis quis dui. Ut sit amet diam ut nulla ultrices tincidunt ut at arcu. In finibus vitae ante vel maximus."
/// createdOn : "2022-04-14T05:27:01.5957682"
/// userFullName : "John Doe 2"
/// userProfilePicPath : "https://packagesapi.jinnbytedev.com/UploadedFiles/ProfilePics/Screenshot_1.png"

NewsFeeds newsFeedsFromJson(String str) => NewsFeeds.fromJson(json.decode(str));
String newsFeedsToJson(NewsFeeds data) => json.encode(data.toJson());
class NewsFeeds {
  NewsFeeds({
      this.newsFeedId, 
      this.filePath, 
      this.title, 
      this.description, 
      this.createdOn, 
      this.userFullName, 
      this.userProfilePicPath,});

  NewsFeeds.fromJson(dynamic json) {
    newsFeedId = json['newsFeedId'];
    filePath = json['filePath'];
    title = json['title'];
    description = json['description'];
    createdOn = json['createdOn'];
    userFullName = json['userFullName'];
    userProfilePicPath = json['userProfilePicPath'];
  }
  int? newsFeedId;
  String? filePath;
  String? title;
  String? description;
  String? createdOn;
  String? userFullName;
  String? userProfilePicPath;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['newsFeedId'] = newsFeedId;
    map['filePath'] = filePath;
    map['title'] = title;
    map['description'] = description;
    map['createdOn'] = createdOn;
    map['userFullName'] = userFullName;
    map['userProfilePicPath'] = userProfilePicPath;
    return map;
  }

}