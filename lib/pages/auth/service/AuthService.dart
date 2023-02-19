import 'dart:async';
import 'package:mobile_apps/commons/StandardResult.dart';
import 'package:mobile_apps/config/Api.dart';
import 'package:mobile_apps/models/Auth.dart';

class AuthService {
  static AuthService? _instance;

  factory AuthService() => _instance ??= AuthService._();

  AuthService._();

  Future<StandardResult> login(Auth auth) async {
    try {
      var response = await Api().dio.post('/auth/login', data: auth);
      return StandardResult.fromJson(response.data);
    } on Exception catch (e) {
      rethrow;
    }
  }
}