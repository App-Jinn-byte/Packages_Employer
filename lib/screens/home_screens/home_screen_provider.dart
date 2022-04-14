import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:packages_mall_employer/models/NewsFeedResponse.dart';
import 'package:packages_mall_employer/network/API.dart';
import 'package:packages_mall_employer/network/api_url.dart';
import 'package:packages_mall_employer/network/models.dart';
import 'package:packages_mall_employer/widgets/loader.dart';

class HomeScreenProvider extends ChangeNotifier{

  BuildContext? context;
  bool isLoading = false;

  // String orderNumber = "";
  // String totalPrice = "";
  // String restaurantName = "";
  // String userFullname = "";
  // String userProfilePicturePath = "";

  final Loader _loader = Loader();
  NewsFeedResponse newsFeedResponse = NewsFeedResponse();

  // List<dynamic> ordersList = [];

  bool isApiHit = false;
  int pageNumber = 1;
  bool status = true;
  late bool newsFeedFetched;


  init({required BuildContext context}) async {
    this.context = context;
    isApiHit = false;
    status = true;
    newsFeedFetched=false;

    await getNewsFeedAPi(pageNumber);
    notifyListeners();
  }

  Future<void> getNewsFeedAPi(int pageNumber) async {
    try {
      // _loader.showLoader(context: context);
      Map<String, dynamic> header = {"Content-Type": "application/json"};

      Map<String, dynamic> param = {
        "PageNumber": pageNumber,
        "PageSize": 10,
        // "riderId": PreferenceUtils.getString(Strings.loginUserId)
      };
      debugPrint("params : ${jsonEncode(param)}");

      newsFeedResponse = await Api.callGetApi(
          url: newsFeedApiUrl,
          parameters: param,
          myHeaders: header,
          modelName: Models.newsFeedModel);

      if (newsFeedResponse.code == 1) {

        debugPrint('News Feed API URL: $newsFeedApiUrl');
        debugPrint('News Feed API URL: $newsFeedApiUrl');

        // if (pageNumber == 1 || ordersList.isEmpty) {
        //   debugPrint('pageNumber $pageNumber');
        //   // isLoading = false;
        //   ordersList = getOrdersResponse.data!;
        // } else {
        //   isLoading = false;
        //   ordersList.addAll(getOrdersResponse.data!);
        // }
        newsFeedFetched = true;
        notifyListeners();
      } else {}
    } catch (e) {
      // _loader.hideLoader(context: context!);

      debugPrint('failed to make get news feed request: $e');
    }
    // return getOrdersResponse;
  }



}