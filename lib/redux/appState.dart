import 'package:flutter/material.dart';
import 'package:mobile_apps/models/application_user.dart';

@immutable
class AppState {
  final LoginState auth;

  const AppState({
    required this.auth,
  });

  factory AppState.initial() => AppState(auth: LoginState.initial());

  AppState copyWith({required LoginState auth,}) {
    return AppState(
      auth : auth
    );
  }

  @override
  String toString() {
    return 'AppState: {}';
  }
}

class LoginState {
  bool isLogin;
  String token;
  final application_user? user;

  LoginState({
    required this.isLogin,
    required this.token,
    this.user
  });

  factory LoginState.initial() => LoginState(
    isLogin: false,
    token: "",
  );
}
