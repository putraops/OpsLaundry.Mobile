import 'dart:async';
import 'package:dio/dio.dart';
import 'package:mobile_apps/commons/StandardResult.dart';
import 'package:mobile_apps/config/Api.dart';
import 'package:mobile_apps/models/Auth.dart';
import 'package:mobile_apps/models/application_user.dart';

class AuthService {
  static AuthService? _instance;

  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  Future<application_user> login(Auth auth) async {
    try {
      var response = await Api().dio.post('/auth/login', data: auth);
      return application_user.fromJson(response.data);
    } on DioError catch (e)  {
      rethrow;
    }
  }
}