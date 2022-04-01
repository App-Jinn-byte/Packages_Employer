import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';



class Toasts {
  static getErrorToast({int? durationTime, @required String? heading}) async {
    await Fluttertoast.showToast(
        msg: heading ?? "Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime ?? 3,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getSuccessToast({int? durationTime, @required String? heading}) async {
    await Fluttertoast.showToast(
        msg: heading ?? "Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime ?? 2,
        backgroundColor: Colors.lightGreen,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  static getWarningToast({int? durationTime, @required String? heading}) async {
    await Fluttertoast.showToast(
        msg: heading ?? "Please try again.",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: durationTime ?? 2,
        backgroundColor: Colors.yellowAccent,
        textColor: Colors.black,
        fontSize: 16.0);
  }


}