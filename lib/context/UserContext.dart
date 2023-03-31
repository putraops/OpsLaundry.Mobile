import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_apps/pages/auth/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/redux/actions.dart';
import 'package:mobile_apps/redux/appState.dart';

// ignore: library_prefixes
import 'package:mobile_apps/components/AppSnackBar.dart';

class UserContext {
  late Future<SharedPreferences> _prefs;

  UserContext() {
    _prefs = SharedPreferences.getInstance();
  }

  Future<application_user?> setUserAsync(application_user? value) async {
    try{
      final SharedPreferences prefs = await _prefs;
      if (value == null) return null;
      prefs.setString("storedUser", jsonEncode(value!));
    } catch (e) {
      print(e);
      AppSnackBar().error("Terjadi Kesalahan!", e.toString());
    }
    return value;
  }

  Future<String?> getToken() async {
    application_user userContext;
    final SharedPreferences prefs = await _prefs;

    try {
      String? jsonString = prefs.getString("storedUser");
      if (jsonString == null) return null;

      Map<String, dynamic> user = jsonDecode(jsonString.toString());
      userContext = application_user.fromJson(user);

    } catch (e) {
      print(e);
      return null;
    }
    return userContext.token;
  }

  Future<application_user?> invokeUser() async {
    application_user userContext;
    final SharedPreferences prefs = await _prefs;

    try {
      String? jsonString = prefs.getString("storedUser");
      if (jsonString == null) return null;

      Map<String, dynamic> user = jsonDecode(jsonString.toString());
      userContext = application_user.fromJson(user);

      // await setLogin(userContext!);
    } catch (e) {
      print(e);
      return null;
    }
    return userContext;
  }

  Future<bool> setLogout() async {
    try{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('storedUser');
    } catch (e) {
      return false;
    }
    return true;

    // var context = NavigationService.navigatorKey.currentContext!;
    // await Navigator.of(context).pushAndRemoveUntil(
    //    MaterialPageRoute(
    //        builder: (BuildContext context) => const LoginPage()),
    //        (Route route) => route == null);
  }
}