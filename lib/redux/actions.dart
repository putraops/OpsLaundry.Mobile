import 'package:mobile_apps/models/application_user.dart';

import 'appState.dart';

class SetLogin {
  final LoginState value;

  SetLogin(this.value);
}

class SetUser {
  final application_user value;

  SetUser(this.value);
}