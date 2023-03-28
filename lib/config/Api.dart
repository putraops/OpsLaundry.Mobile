import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:mobile_apps/commons/ErrorResponse.dart';
// ignore: library_prefixes
import 'package:mobile_apps/components/AppSnackBar.dart';
import 'package:mobile_apps/context/UserContext.dart';

import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';
import 'package:mobile_apps/pages/auth/LoginPage.dart';

//-- utils.
import 'package:mobile_apps/utils/TryCast.dart';

class Api {
  final dio = createDio();
  static const String serverEndpoint = "https://97d6-2001-448a-2040-1a3b-5071-4c56-36f7-671d.ap.ngrok.io";
  static const String baseUrl = "$serverEndpoint/api";

  Api._internal();

  static final _singleton = Api._internal();

  factory Api() => _singleton;

  static Dio createDio() {

    var dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      receiveTimeout: 15000, // 15 seconds = 15000
      connectTimeout: 15000,
      sendTimeout: 15000,
    ));

    dio.interceptors.addAll({
      AppInterceptors(dio),
    });

    return dio;
  }
}

class AppInterceptors extends Interceptor {
  final Dio dio;

  AppInterceptors(this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    print("Request uri: ${options.uri}");
    //var accessToken = await UserContext().getToken() ?? "";
    //options.headers['Authorization'] = accessToken;
    return handler.next(options);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    switch (err.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        AppSnackBar().error("Ooops!!", NoInternetConnectionException(err.requestOptions).toString(), durationSeconds: 2.5);
        throw DeadlineExceededException(err.requestOptions);
      case DioErrorType.response:
        switch (err.response?.statusCode) {
          case 400:
            if (err.requestOptions.path == "/auth/login") {
              throw err;
            } else {
              //err.response.statusMessage = e.response?.statusMessage;
              // final Map<String, dynamic> obj = jsonDecode(err.response?.data);
              // var errResponse = ErrorResponse.fromJson(obj);
              // print("======================= err.response!.statusMessage ======================= ");
              // print(err?.response?.data);
              // //err.response.statusMessage
              // print("======================= err.response!.statusMessage ======================= ");
              // throw err?.response?.data;
              throw err;

              //throw BadRequestException(err.requestOptions);
            }
          case 401:
            try {
              var errResponse = ErrorResponse.fromJson(err.response?.data as Map<String, dynamic>);
              AppSnackBar().error(errResponse.error, "Silahkan login Kembali!");
            } on Exception catch(e) {
              AppSnackBar().error("Ooops!!", e.toString());
            }
            throw UserContext().setLogout();
          case 404:
            AppSnackBar().error("API Endpoint is not found!", NotFoundException(err.requestOptions).toString(), durationSeconds: 4);
            throw NotFoundException(err.requestOptions);
          case 409:
            throw ConflictException(err.requestOptions);
          case 500:
            throw InternalServerErrorException(err.requestOptions);
          case 502:
            AppSnackBar().error(BadGatewayException(err.requestOptions).toString(), "Please contact the Administrator.", durationSeconds: 4);
            break;
          default:
            AppSnackBar().error("Something went wrong!", "Please contact the Administrator...", durationSeconds: 4);
            break;
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        print("==========================================================================================");
        print("DioErrorType.other");
        print((err.error as HttpException).message);
        if (err.error is HttpException && (err.error as HttpException).message.contains("Connection closed before full header was received")) {
          var context = NavigationService.navigatorKey.currentContext!;
          Navigator.of(context).push(AnimateNavigation(const LoginPage()));
          break;
        }
        print("==========================================================================================");
        throw NoInternetConnectionException(err.requestOptions);
    }
    return handler.next(err);
  }
}

class BadRequestException extends DioError {
  BadRequestException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Invalid request';
  }
}

class InternalServerErrorException extends DioError {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Unknown error occurred, please try again later.';
  }
}

class BadGatewayException extends DioError {
  BadGatewayException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Bad Gateway!';
  }
}

class ConflictException extends DioError {
  ConflictException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Conflict occurred';
  }
}

class UnauthorizedException extends DioError {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'Access denied';
  }
}

class NotFoundException extends DioError {
  NotFoundException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The requested information could not be found';
  }
}

class NoInternetConnectionException extends DioError {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'No internet connection detected, please try again.';
  }
}

class DeadlineExceededException extends DioError {
  DeadlineExceededException(RequestOptions r) : super(requestOptions: r);

  @override
  String toString() {
    return 'The connection has timed out, please try again.';
  }
}