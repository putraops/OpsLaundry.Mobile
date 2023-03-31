import 'package:dio/dio.dart';
import 'package:mobile_apps/commons/ErrorResponse.dart';
import 'package:mobile_apps/commons/StandardResult.dart';
import 'package:mobile_apps/components/AppSnackBar.dart';
import 'package:mobile_apps/config/Api.dart';
import 'package:mobile_apps/context/UserContext.dart';
import 'package:mobile_apps/models/pagination/DataTableRequest.dart';
import 'package:mobile_apps/models/pagination/DataTablesResponse.dart';
import 'package:mobile_apps/utils/TryCast.dart';

class BaseRepository {
  late String? _module;

  BaseRepository(String? module) {
    _module = module;
  }

  Future<dynamic> createOrUpdate({required dynamic object, String? token }) async {
    var api = Api();
    dynamic result;
    Map<String,dynamic> headers = <String,dynamic>{};
    if (token == null) {
      var accessToken = await UserContext().getToken() ?? "";
      headers["Authorization"] = accessToken;
    } else {
      headers["Authorization"] = token;
    }

    late bool isNew = true;
    try {
      Response response;
      var temp = TryCast().toObject<Map<String, dynamic>>(object);
      if (temp!["id"] == null) {
        response = await api.dio.post('/$_module/create', data: object, options: Options(headers: headers));
      } else {
        isNew = false;
        response = await api.dio.patch('/$_module/update', data: object, options: Options(headers: headers));
      }

      switch(response.statusCode){
        case 200:
          result = response.data;
          break;
        case 201:
          result = response.data;
          break;
        case 204:
          result = "Data dengan id ${temp["id"]} tidak ditemukan!";
          break;
        default:
          AppSnackBar().error("Something went wrong!", "There is an unrecognized response from server.");
          break;
      }
    } on DioError catch (e) {
      var temp = TryCast().toObject<ErrorResponse>(e.response?.data);
      try {
        var errResponse = ErrorResponse.fromJson(e.response?.data);
        result = errResponse.error;
      } on Exception catch (e) {
        print("==================================================");
        if (isNew) {
          result = "Failed to create an item";
        } else {
          result = "Failed to update the item";
        }
        print("==================================================");
      }
    }
    return result;
  }

  Future<dynamic> getById({required String id, String? token }) async {
    var api = Api();
    dynamic result;
    Map<String,dynamic> headers = <String,dynamic>{};

    try{
      if (token == null) {
        var accessToken = await UserContext().getToken() ?? "";
        headers["Authorization"] = accessToken;
      } else {
        headers["Authorization"] = token;
      }

      var response = await api.dio.get("/$_module/getById/$id", options: Options(headers: headers));
      if (response.statusCode == 200) {
        result = response.data;
      } else if (response.statusCode == 204) {
        result = "Data dengan id $id tidak ditemukan!";
      }  else {
        AppSnackBar().error("Something went wrong!", "There is an unrecognized response from server.");
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return result;
  }

  Future<DataTablesResponse> getPagination(DataTableRequest request, { String? token }) async {
    var api = Api();
    DataTablesResponse dt = DataTablesResponse();
    Map<String,dynamic> headers = <String,dynamic>{};

    try{
      if (token == null) {
        var accessToken = await UserContext().getToken() ?? "";
        headers["Authorization"] = accessToken;
      } else {
        headers["Authorization"] = token;
      }

      Response response = await api.dio.post("/$_module/getPagination",
          data: request.toJson(),
          //queryParameters: action.params,
          options: Options(headers: headers));

      if (response.statusCode == 200) {
        dt = DataTablesResponse.fromJson(response.data);
      }
    } on DioError catch (e) {
      print(e.response);
    }
    return dt;
  }

  Future<StandardResult> deleteById({required String id, String? token }) async {
    var api = Api();
    StandardResult response;
    Map<String,dynamic> headers = <String,dynamic>{};
    if (token == null) {
      var accessToken = await UserContext().getToken() ?? "";
      headers["Authorization"] = accessToken;
    } else {
      headers["Authorization"] = token;
    }

    try {
      var result = await api.dio.delete("/$_module/deleteById/$id",options: Options(method: "DELETE", headers: headers),);
      switch(result.statusCode){
        case 200:
          response = StandardResult(success: true, message: "Berhasil menghapus data!", data: null);
          break;
        case 204:
          response = StandardResult(success: false, message: "Data dengan $id tidak ditemukan!", data: null);
          break;
        default:
          var errorResponse = ErrorResponse.fromJson(result.data);
          response = StandardResult(success: false, message: errorResponse.error, data: null);
          break;
      }
    } on DioError catch (e) {
      response = StandardResult(success: false, message: e.response as String, data: null);
    }
    return response;
  }
}