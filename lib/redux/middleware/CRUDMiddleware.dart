import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile_apps/components/AppSnackBar.dart';
import 'package:mobile_apps/components/CustomAlertDialog.dart';
import 'package:mobile_apps/components/AppDialog.dart';
import 'package:mobile_apps/config/Api.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTableRequest.dart';
import 'package:mobile_apps/redux/actions.dart';
import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/repository/BaseRepository.dart';
import 'package:mobile_apps/utils/TryCast.dart';
import 'package:redux/redux.dart';

class CRUDMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, NextDispatcher next) async {
    var api = Api();
    late String? token = "";
    if (store.state.user != null) {
      token = (store.state.user as application_user).token;
    }

    if (token == null) {
      return;
    }

    Map<String,dynamic> headers = <String,dynamic>{};
    headers["Authorization"] = token;
    if (action is CreateOrUpdate)
    {
      store.dispatch(SetLoading(true));

      Response response;
      var temp = TryCast().toObject<Map<String, dynamic>>(action.request);
      if (temp!["id"] == null) {
        response = await api.dio.post('/product_category/create', data: action.request, options: Options(headers: headers));
      } else {
        response = await api.dio.patch('/product_category/update', data: action.request, options: Options(headers: headers));
      }

      store.dispatch(SetLoading(false));
      switch(response.statusCode){
        case 200:
          store.dispatch(SetObjectResponse(response?.data));
          break;
        case 201:
          store.dispatch(SetObjectResponse(response?.data));
          break;
        default:
          AppSnackBar().error("Something went wrong!", "There is an unrecognized response from server.");
          break;
      }
    }
    else if (action is GetById)
    {
      if (action.id == null) {
        store.dispatch(const SetObjectResponse(null));
      } else {
        store.dispatch(SetLoading(true));
        var response = await api.dio.get("/${action.path}/getById/${action.id}", options: Options(headers: headers));
        if (response.statusCode == 200) {
          store.dispatch(SetLoading(false));
          store.dispatch(SetObjectResponse(response?.data));
        } else {
          AppSnackBar().error("Something went wrong!", "There is an unrecognized response from server.");
        }
      }
    }
    else if (action is GetPagination)
    {
      try{
        print(jsonEncode(action.request));
        var repo = BaseRepository(action.path);
        var dt = await repo.getPagination(DataTableRequest.fromJson(action.request), token: token);

        store.dispatch(SetLoading(false));
        if (dt.error == null) {
          await store.dispatch(SetDataTables(dt));
        } else {
          store.dispatch(SetErrorMessage(dt.error!));
        }
        // Response response = await api.dio.post("/${action.path}/getPagination",
        //     data: action.request,
        //     queryParameters: action.params,
        //     options: Options(headers: headers));
        //
        // if (response.statusCode == 200) {
        //   var dt = DataTablesResponse.fromJson(response?.data);

        // }
      } on DioError catch (e) {
        store.dispatch(SetLoading(false));
        store.dispatch(SetErrorMessage(e.response?.data));
      }
    } else if (action is DeleteById) {
      // if (action.id == null) {
      //   store.dispatch(SetErrorMessage("Parameter id cannot be null"));
      // } else {
      //   confirmDialog(
      //       callback: (value) async {
      //         if (value) {
      //           var response = await Api().dio.delete("/${action.path}/deleteById/${action.id}", options: Options(headers: headers));
      //
      //           switch(response.statusCode){
      //             case 200:
      //               Future.delayed(const Duration(milliseconds: 0), () async {
      //                 //await interactiveDialog(DialogType.Success, "Berhasil menghapus data!", callback: () async {
      //                 //store.dispatch(SetObjectResponse(response?.data));
      //                 //});
      //                 store.dispatch(SetHasUpdate());
      //               },);
      //               break;
      //             case 204:
      //               appDialog(DialogType.Warning, dialogText: "Data is not found with id ${action.id}",);
      //               break;
      //             default:
      //               AppSnackBar().error("Something went wrong!", "There is an unrecognized response from server.");
      //               break;
      //           }
      //         }
      //       },
      //       confirmButtonText: "Hapus",
      //       cancelButtonText: "Batal",
      //       hasCancelButton: true,
      //       reverse: true
      //   );
      // }
    }
    next(action);
  }
}
