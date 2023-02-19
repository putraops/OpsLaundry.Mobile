import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/redux/actions.dart';
import 'package:mobile_apps/redux/appState.dart';

// ignore: library_prefixes
import 'package:mobile_apps/components/CustomSnackBar.dart' as snackBar;

class UserContext {
  UserContext._internal();
  factory UserContext() => UserContext._internal();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<application_user?> setUserAsync(dynamic value) async {
    application_user? user;
    try{
      final SharedPreferences prefs = await _prefs;
      if (value == null) return null;
      user = application_user.fromJson(value);
      prefs.setString("storedUser", jsonEncode(user!));

      //var temp = user!;
      await setLogin(user);
    } catch (e) {
      snackBar.error("Terjadi Kesalahan!", e.toString());
    }
    return user;
  }

  Future<application_user?> getUserAsync() async {
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
    return userContext;
  }

  Future<application_user?> invokeUser() async {
    application_user userContext;
    final SharedPreferences prefs = await _prefs;

    try {
      String? jsonString = prefs.getString("storedUser");
      if (jsonString == null) return null;

      Map<String, dynamic> user = jsonDecode(jsonString.toString());
      userContext = application_user.fromJson(user);

      await setLogin(userContext!);
    } catch (e) {
      print(e);
      return null;
    }
    return userContext;
  }

  Future<void> setLogin(application_user user) async {
    final store = StoreProvider.of<AppState>(NavigationService.navigatorKey.currentContext!);
    store.dispatch(SetLogin(LoginState(isLogin: true, token: user.token!, user: user)));
    // store.dispatch(SetUser(user!));
  }
}