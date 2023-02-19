import 'package:flutter/material.dart';
import 'package:mobile_apps/context/UserContext.dart';
import 'package:mobile_apps/models/Auth.dart';
import 'package:mobile_apps/navigation/NavigationBarController.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/commons/StandardResult.dart';
import 'package:mobile_apps/components/CustomSnackBar.dart' as snackBar;

import '../service/AuthService.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? _autoValidate = AutovalidateMode.disabled;

  final _auth = Auth(email: "", password: "");
  bool isDisabled = false;
  bool isVerifying = false;

  @override
  Widget build(BuildContext context) {
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
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 3),
              borderRadius: BorderRadius.circular(50),
            ),
            borderFocused: OutlineInputBorder(
              borderSide:  const BorderSide(color: Colors.blue, width: 1.25),
              borderRadius: BorderRadius.circular(50),
            ),
            disabled: isDisabled,
            prefixIcon: Icon(Icons.account_circle, color: Color.fromRGBO(0, 0, 0, isDisabled ? 0.3 : 0.5)),
            onSaved: (value) {
              setState(() {
                _auth.email = value;
              });
            },
            textInputAction: TextInputAction.next,
            obscureText: false,
          ),

          const SizedBox(height: 15,),
          CustomTextFormField(
            validate: true,
            keyboardType: TextInputType.text,
            hintText: "Masukkan Password",
            errorText: "Password tidak boleh kosong.",
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 2,),
              borderRadius: BorderRadius.circular(50),
            ),
            borderFocused: OutlineInputBorder(
              borderSide:  const BorderSide(color: Colors.blue, width: 1.5),
              borderRadius: BorderRadius.circular(50),
            ),
            prefixIcon: Icon(Icons.lock, color: Color.fromRGBO(0, 0, 0, isDisabled ? 0.3 : 0.5)),
            disabled: isDisabled,
            onChange: _onChanged,
            onSaved: (value) {
              setState(() {
                _auth.password = value;
              });
            },
            textInputAction: TextInputAction.send,
            obscureText: true,
          ),

          const SizedBox(height: 20,),
          ElevatedButton.icon(
            onPressed: isDisabled ? null : _validateInputs,
            // onPressed: null,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(16.0),
              minimumSize: const Size(double.infinity, 55),
              disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
            ),
            icon: isDisabled ?
            Container(
              width: 24,
              height: 24,
              padding: const EdgeInsets.all(2.0),
              child: const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),
            ) : const Icon(null),
            label: Text(isDisabled ? (isVerifying ? "Sedang verifikasi..." : "Silahkan tunggu...") : "Login",
                style: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 1),
                    fontSize: 17,
                    fontWeight: FontWeight.w500,
                    letterSpacing: -.5
                )
            ),
          ),
        ],
      ),
    );
  }

  void _onChanged() {
    print("onchaged...");
  }

  void _validateInputs() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() { isDisabled = true; });

      try {
        StandardResult result = await AuthService().login(_auth);
        if (result.success) {
          setState(() { isVerifying = true; });
          var user = await UserContext().setUserAsync(result.data);
          if (user != null) {
            Future.delayed(const Duration(seconds: 2), () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (BuildContext context) => const BottomNavigationBarController()), (Route route) => route == null);
            });
          }

        } else {
          snackBar.error("Login Gagal!", result.message, durationSeconds: 2);
          setState(() { isDisabled = false; isVerifying = false;});
        }
      } on Exception catch (e) {
        setState(() { isDisabled = false; isVerifying = false;});
      }
    } else {
      //-- From Invalid, it must be some required fields are empty
      setState(() {
        _autoValidate = AutovalidateMode.onUserInteraction;
      });
    }
  }
}