import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps/commons/ErrorResponse.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/context/UserContext.dart';
import 'package:mobile_apps/navigation/MainNavigation.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/components/AppSnackBar.dart';

import 'package:mobile_apps/config/Api.dart';
import 'package:redux/redux.dart';

import '../actions.dart';

class AuthMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    var api = Api();

    switch(action.runtimeType) {
      case Authenticate:
        try {
          action = action as Authenticate;
          await store.dispatch(SetLoading(true));
          Response response = await api.dio.post('/auth/login', data: action.auth.toJson());
          if (response.statusCode == 200) {
            await store.dispatch(SetVerifying());
            var result =  application_user.fromJson(response.data);
            var user = await UserContext().setUserAsync(result);
            if (user != null) {
              store.dispatch(SetLogin());
              store.dispatch(InvokeUser(user));
              Future.delayed(const Duration(seconds: 2), () async {
                var context = NavigationService.navigatorKey.currentContext!;
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => MainNavigation(store)), (Route route) => route == null);
              });
            }
          }
        } on DioError catch (e) {
          store.dispatch(SetLoading(false));
          switch(e.response?.statusCode ?? 0) {
            case 400:
              var errorResponse = ErrorResponse.fromJson(e.response?.data);
              String errorMessage = errorResponse.error;
              AppSnackBar().error("Login Gagal!", errorMessage, durationSeconds: 2);
              break;
            default:
              AppSnackBar().error("Something went wrong!", "Unrecognized error. Please contact the administrator.", durationSeconds: 4);
              break;
          }
          rethrow;
        }
        break;
    }
    next(action);
  }
}
