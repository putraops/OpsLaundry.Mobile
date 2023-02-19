// lib/reducers/test_reducer.dart
import 'package:mobile_apps/models/application_user.dart';
import 'package:redux/redux.dart';
// import 'package:sample_flutter_redux_app/actions/actions.dart';
import 'package:mobile_apps/redux/actions.dart';

import '../appState.dart';

final authReducer = TypedReducer<LoginState, SetLogin>(_setLogin);
final userReducer = TypedReducer<application_user, SetUser>(_setUser);

LoginState _setLogin(LoginState value, SetLogin action) {
  return action.value;
}

LoginState _getUser(LoginState value) {
  return value;
}

application_user _setUser(application_user value, SetUser action) {
  return action.value;
}