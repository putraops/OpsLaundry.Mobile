// import 'package:mobile_apps/redux/appState.dart';
// import 'package:redux/redux.dart';
//
// enum Actions {Check}
//
// final combineExampleReducer = combineReducers<AppState>([
//   // TypedReducer<SignInState,ValidateEmailAction>(_validateEmail),
// ]);
//
// // LoginState _validateEmail(LoginState state, ValidateEmailAction action){
// //   return state.copyWith(email: action.email);
// // }
//
// bool _validateEmail(String email, dynamic action){
//   if (action.Check) {
//     return true;
//   }
//   return false;
//   //return state.copyWith(password: action.email, username: '');
// }
//
// class ValidateEmailAction{
//   final String email;
//   ValidateEmailAction(this.email);
// }