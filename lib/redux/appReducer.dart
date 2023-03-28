import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/models/pagination/DataTablesResponse.dart';
import 'package:mobile_apps/redux/actions.dart';

import 'appState.dart';

AppState appReducer(AppState state, action) {
  //print("appReducer ${action.runtimeType} from appReducer...\n");
  switch (action.runtimeType) {
    case SetErrorMessage:
      return state.copyWith(errorMessage: action.value,);
    case ClearObject:
      return state.copyWith(object: null);
    case ClearDataTables:
      return state.copyWith(datatable: null);
    case ClearErrorMessage:
      return state.copyWith(errorMessage: null);
    case SetLoading:
      return state.copyWith(loading: action.value,);
    case SetDataTables:
      return state.copyWith(datatable: action.response);
    case SetObjectResponse:
      return state.copyWith(object: action.response, hasUpdate: true);
    case SetHasUpdate:
      return state.copyWith(hasUpdate: action.value);
    case SetVerifying:
      return state.copyWith(loading: true, isVerifying: true);
    case InvokeUser:
      return state.copyWith(user: action.user);
    case SetLogin:
      return state.copyWith(isLogin: true);
    case SetLogout:
      return state.copyWith(isLogin: false);
    default:
      return state;
  }
}
