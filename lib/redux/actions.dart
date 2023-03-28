import 'package:flutter/cupertino.dart';
import 'package:mobile_apps/models/Auth.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTablesResponse.dart';

class SetLoading {
  final bool value;
  SetLoading(this.value);
}

class Authenticate {
  final Auth auth;
  const Authenticate(this.auth);
}

class SetErrorMessage {
  final String value;
  SetErrorMessage(this.value);
}

class ClearErrorMessage {}
class ClearDataTables {}
class ClearObject {}
class SetVerifying {}
class SetVerified {}
class SetLogin {}
class SetLogout {}
class SetHasUpdate {
  final bool value;
  const SetHasUpdate(this.value);
}

@immutable
class InvokeUser {
  final application_user? user;
  const InvokeUser(this.user);
}

class CreateOrUpdate {
  final BuildContext context;
  final String path;
  final dynamic request;
  final Map<String, dynamic>? params;
  CreateOrUpdate(this.context, this.path, this.request, { this.params });
}
class GetById {
  final BuildContext context;
  final String path;
  final String? id;
  final Map<String, dynamic>? params;
  GetById(this.context, this.path, { this.id, this.params });
}
class DeleteById {
  final BuildContext context;
  final String path;
  final String? id;
  DeleteById(this.context, this.path, { this.id });
}
class GetPagination {
  final BuildContext context;
  final String path;
  final dynamic request;
  final Map<String, dynamic>? params;
  GetPagination(this.context, this.path, this.request, {this.params});
}

class SetDataTables {
  final DataTablesResponse response;
  const SetDataTables(this.response);
}
class SetObjectResponse {
  final dynamic response;
  const SetObjectResponse(this.response);
}
