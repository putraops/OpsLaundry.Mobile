import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:mobile_apps/commons/ErrorResponse.dart';
import 'package:mobile_apps/context/UserContext.dart';
import 'package:mobile_apps/models/Auth.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/navigation/MainNavigation.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/components/AppSnackBar.dart';
import 'package:mobile_apps/redux/actions.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:redux/redux.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? _autoValidate = AutovalidateMode.disabled;

  late final Auth _auth;

  @override
  void initState() {
    _auth = Auth(email: "", password: "");
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginState>(
      converter: LoginState.fromState,
      onInit: (store) => {
        FocusScope.of(context).unfocus(),
        store.dispatch(SetLoading(false)),
      },
      builder: (context, state) {
        Widget textFieldIcon(IconData icons) {
          return Icon(icons, color: Color.fromRGBO(0, 0, 0, state.loading ? 0.3 : 0.5));
        }
        final borderFocused = OutlineInputBorder(
          borderSide:  const BorderSide(color: Colors.blue, width: 1.25),
          borderRadius: BorderRadius.circular(50),
        );
        final border = OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey, width: 3),
          borderRadius: BorderRadius.circular(50),
        );

        return Form(
          key: formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            children: [
              CustomTextFormField(
                validate: true,
                keyboardType: TextInputType.text,
                hintText: "Masukkan Username atau Email",
                errorText: "Username atau Email tidak boleh kosong.",
                border: border,
                borderFocused: borderFocused,
                disabled: state.loading,
                prefixIcon: Icon(Icons.account_circle, color: Color.fromRGBO(0, 0, 0, state.loading ? 0.3 : 0.5)),
                onChangeCallback: (value) => { formKey.currentState!.validate(), },
                onSaved: (value) { setState(() { _auth.email = value; }); },
                textInputAction: TextInputAction.next,
              ),

              const SizedBox(height: 15,),
              CustomTextFormField(
                validate: true,
                keyboardType: TextInputType.text,
                hintText: "Masukkan Password",
                errorText: "Password tidak boleh kosong.",
                border: border,
                borderFocused: borderFocused,
                prefixIcon: textFieldIcon(Icons.lock),
                disabled: state.loading,
                onChangeCallback: (value) => { formKey.currentState!.validate(), },
                onSaved: (value) { setState(() { _auth?.password = value; }); },
                textInputAction: TextInputAction.send,
                obscureText: true,
              ),

              const SizedBox(height: 20,),
              ElevatedButton.icon(
                onPressed: state.loading ? null : () => {
                  FocusScope.of(context).unfocus(),
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save(),
                    state.login(_auth),
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16.0),
                  minimumSize: const Size(double.infinity, 55),
                  disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
                ),
                icon: state.loading ?
                Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.all(2.0),
                  child: const CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ),
                ) : Container(width: 0,),
                label: Text(state.loading ? (state.isVerifying ? "Sedang Verifikasi..." : "Silahkan tunggu...") : "Login",
                    style: const TextStyle( color: Colors.white, fontSize: 16, fontWeight: FontWeight.w700, )
                ),
              ),
            ],
          ),
        );
      }
    );

  }

  Future<void> clearPassword() async {
    setState(() {
      _auth.password = "";
    });
  }

  // void _validateInputs() async {
  //   if (formKey.currentState!.validate()) {
  //     formKey.currentState!.save();
  //     //setState(() { isDisabled = true; });
  //
  //     try {
  //       application_user result = await AuthService().login(_auth);
  //       var user = await UserContext().setUserAsync(result);
  //       if (user != null) {
  //         Future.delayed(const Duration(seconds: 2), () {
  //           Navigator.of(context).pushAndRemoveUntil(
  //               MaterialPageRoute(builder: (BuildContext context) => const BottomNavigationBarController()), (Route route) => route == null);
  //         });
  //       }
  //     } on Exception catch (e) {
  //       await clearPassword();
  //       if (e is DioError) {
  //         Future.delayed(const Duration(milliseconds: 1500), () {
  //           if (e.response?.statusCode == 400) {
  //             var errorResponse = ErrorResponse.fromJson(e.response?.data);
  //             String errorMessage = errorResponse.error;
  //             AppSnackBar().error("Login Gagal!", errorMessage, durationSeconds: 2);
  //           }
  //         });
  //       } else {
  //       }
  //     }
  //   } else {
  //     setState(() {
  //       _autoValidate = AutovalidateMode.onUserInteraction;
  //     });
  //   }
  // }
}

class LoginState {
  final Function(Auth) login;
  final Function(bool)? setLoading;
  final bool loading;
  final bool isVerifying;

  LoginState({
    required this.login,
    required this.loading,
    required this.isVerifying,
    this.setLoading,
  });

  static LoginState fromState(Store<AppState> store) {
    return LoginState(
      login: (auth) => store.dispatch(Authenticate(auth)),
      loading: store.state.loading ?? false,
      isVerifying: store.state?.isVerifying ?? false,
      setLoading: (value) => store.dispatch(SetLoading(value)),
    );
  }
}