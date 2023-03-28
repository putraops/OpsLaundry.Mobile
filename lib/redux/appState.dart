import 'dart:convert';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTablesResponse.dart';

class AppState {
  dynamic user;
  bool? isLogin;
  bool? isVerifying;
  bool? loading;
  String? errorMessage;
  final DataTablesResponse? datatable;
  final dynamic object;
  bool? hasUpdate;

  AppState({
    this.user,
    this.isLogin = false,
    this.isVerifying = false,
    this.loading = false,
    this.errorMessage,
    this.datatable,
    this.object,
    this.hasUpdate = false,
  });

  factory AppState.initial() => AppState();

  AppState copyWith({
    dynamic user,
    bool? isLogin,
    bool? isVerifying,
    bool? loading,
    String? errorMessage,
    DataTablesResponse? datatable,
    dynamic object,
    bool? hasUpdate,
  }) {
    return AppState(
      user: user ?? this.user,
      isLogin: isLogin ?? this.isLogin,
      isVerifying: isVerifying ?? this.isVerifying,
      loading: loading ?? this.loading,
      errorMessage: errorMessage,
      datatable: datatable,
      object: object,
      hasUpdate: hasUpdate,
    );
  }

  static AppState? fromJson(dynamic json) {
    if (json == null) {
      return null;
    }
    return AppState(
      user: json['user'] is application_user ? json['user'] : application_user.fromJson((jsonDecode(jsonEncode(json['user'])))),
      isLogin: json['isLogin'] as bool?,
      isVerifying: json['isVerifying'] as bool?,
      loading: json['loading'] as bool?,
      errorMessage: json['errorMessage'] as String?,
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'user': user,
    'isLogin': isLogin,
  };
}























// class UserState {
//   bool canDelete;
//   String token;
//   final application_user? user;
//
//   UserState({
//     required this.canDelete,
//     required this.token,
//     this.user
//   });
//
//   factory UserState.initial() => UserState(
//     canDelete: false,
//     token: "",
//   );
// }
//
// class AuthState {
//   bool isLogin;
//   bool isVerifying;
//   bool isVerified;
//
//   AuthState({
//     this.isLogin = false,
//     required this.isVerifying,
//     this.isVerified = false,
//   });
//
//   factory AuthState.initial() => AuthState(
//     isLogin: false,
//     isVerifying: true,
//     isVerified: false,
//   );
// }
