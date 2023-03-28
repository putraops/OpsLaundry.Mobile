import 'dart:convert';

import 'package:mobile_apps/models/application_user.dart';

import '../models/pagination/DataTablesResponse.dart';
import 'appState.dart';

DataTablesResponse? getDataTablesResponse(AppState state) => state.datatable;
dynamic getObjectResponse(AppState state) => state.object;
dynamic getUser(AppState state) => state.user;
//
// String? getError(AppState state) => state.errorResponse;
// String? getErrorChart(AppState state) => state.errorChart;
// List<SaleModel> getSales(AppState state) => state.sales ?? [];
// bool? isLoading(AppState state) => state.loading;
//
// String getToken(AppState state) => state.token ?? "";
//
// String getUserId(AppState state) => state.userId ?? "";
//
// String getReferralCode(AppState state) => state.referralCode ?? "";
