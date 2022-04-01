import 'dart:async' show Future;
import 'package:flutter/material.dart';
import 'package:packages_mall_employer/res/strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  var time = DateTime;
  static String? userId;

  static Future<SharedPreferences> get _instance async =>
      _prefsInstance ??= await SharedPreferences.getInstance();
  static SharedPreferences? _prefsInstance;

  static Future<SharedPreferences> init() async {
    _prefsInstance = await _instance;
    return _prefsInstance!;
  }


  static String? getString(String? key, [String? defValue]) {
    if (PreferenceUtils._prefsInstance != null)
      return _prefsInstance!.getString(key!) ?? defValue ?? "";
  }

  static Future<bool> setString(String key, String value) async {
    var prefs = await _instance;

    return prefs.setString(key, value);
  }

  static List<String>? getStringList(String? key, [List<String>? defaultList]) {
    List<String> temp = [];
    if (PreferenceUtils._prefsInstance != null)
      return _prefsInstance!.getStringList(key!) ?? defaultList ?? temp;
  }

  static Future<bool> setStringList(String key, List<String> list) async {
    var prefs = await _instance;

    return prefs.setStringList(key, list);
  }

  static Future<bool> setBool(String key, bool value) async {
    var prefs = await _instance;
    return prefs.setBool(key, value);
  }

  static bool? getBool(String key, [bool? defValue]) {
    return _prefsInstance!.getBool(key) ?? defValue ?? false;
  }

  static Future<bool> setInt(String key, int value) async {
    var prefs = await _instance;

    return prefs.setInt(key, value);
  }

  static int getInt(String key, [int? defValue]) {
    return _prefsInstance!.getInt(key) ?? defValue ?? 0;
  }

  static clearPreferences() {
    _prefsInstance!.clear();
  }

  static Future<bool> setDouble(String key, double value) async {
    var prefs = await _instance;
    return prefs.setDouble(key, value);
  }

  static double getDouble(String key, [double? defValue]) {
    return _prefsInstance!.getDouble(key) ?? defValue ?? 0;
  }

  static Future<void> saveData({@required Map<String, dynamic>? data}) async {
    data!.forEach((key, value) async {
      switch (value.runtimeType) {
        case String:
          await PreferenceUtils.setString(key, value);
          return;
        case int:
          await PreferenceUtils.setInt(key, value);
          return;
        case bool:
          await PreferenceUtils.setBool(key, value);
          return;
      }
    });
  }

  static String getUserId() {
    return PreferenceUtils.getString(Strings.userIdKey) ?? "";
  }

  static setUserId(String name) async {
    PreferenceUtils.setString(Strings.userIdKey, name);
  }

  static String getUserName() {
    return (PreferenceUtils.getString(Strings.firstName) ?? "") +
        " " +
        (PreferenceUtils.getString(Strings.lastName) ?? "");
  }

  static String getProfilePicture() {
    return PreferenceUtils.getString(Strings.profilePicture) ?? "";
  }

  static String getCreatedOn() {
    return PreferenceUtils.getString(Strings.createdOn) ?? "";
  }

  static Future<void> savePickupLocations(String key, List<String> list) async {
    await PreferenceUtils.setStringList(key, list);
  }
}
