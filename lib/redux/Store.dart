import 'package:mobile_apps/redux/appState.dart';
import 'package:mobile_apps/redux/appReducer.dart';
import 'package:redux/redux.dart';

final store = Store<AppState>(
  appReducer,
  initialState: AppState(auth: LoginState.initial())
);