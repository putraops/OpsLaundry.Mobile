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

  Future<application_user?> setUserAsync(application_user? value) async {
    try{
      final SharedPreferences prefs = await _prefs;
      if (value == null) return null;
      prefs.setString("storedUser", jsonEncode(value!));
      await setLogin(value);
    } catch (e) {
      print(e);
      snackBar.error("Terjadi Kesalahan!", e.toString());
    }
    return value;
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