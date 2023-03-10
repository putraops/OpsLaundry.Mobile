import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/models/product_category.dart';

class DetailForm extends StatefulWidget {
  final product_category? record;

  const DetailForm({
    this.record,
    super.key
  });

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? _autoValidate = AutovalidateMode.disabled;
  late bool isLoading = false;
  static const double titleSize = 13;

  @override
  initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchServices() async {
    setState(() { isLoading = true; });
    await Future.delayed(const Duration(seconds: 1), () async { setState(() { isLoading = false; });},);
  }

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Form(
          key: formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("Nama", style: TextStyle(fontSize: titleSize),),
              InputField(
                validate: true,
                isDense: true,
                textInputAction: TextInputAction.next,
                floatingLabelBehavior: FloatingLabelBehavior.never,
                contentPadding: const EdgeInsets.only(top: 2.5, bottom: 7.5),
                hintText: "Contoh: Baju",
                hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.375), letterSpacing: -.5),
                errorText: "Nama tidak boleh kosong.",
                border: const UnderlineInputBorder(),
                borderFocused: const UnderlineInputBorder(
                  borderSide:  BorderSide(color: Color.fromRGBO(13, 110, 253, .75), width: 1.75),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.75),
                ),
                value: widget.record?.name,
                onSaved: (value) {
                  print(value);
                  setState(() {
                    widget.record!.name = value!;
                  });
                },
              ),

              const SizedBox(height: 20,),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(double.infinity, 45),
                  disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // <-- Radius
                  ),
                ),
                onPressed: isLoading ? null : _validateInputs,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (isLoading) (
                        Container(
                          width: 24,
                          height: 24,
                          padding: const EdgeInsets.all(2.0),
                          child: const CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2.5,
                          ),
                        )
                    ),
                    if (isLoading) const SizedBox(width: 7.5,),
                    Text(isLoading ? "Silahkan tunggu..." : "Tambah",
                        style: const TextStyle(
                            color: Color.fromRGBO(255, 255, 255, 1),
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: -.25
                        )
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _validateInputs() async {
    FocusManager.instance.primaryFocus?.unfocus();

    print(formKey.currentState!.validate());

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      setState(() { isLoading = true; });
      await Future.delayed(const Duration(seconds: 1), () async { setState(() { isLoading = false; });},);

      try {
        if (true) {
        //   setState(() { isVerifying = true; });
        //   var user = await UserContext().setUserAsync(result.data);
        //   if (user != null) {
        //     Future.delayed(const Duration(seconds: 2), () {
        //       Navigator.of(context).pushAndRemoveUntil(
        //           MaterialPageRoute(builder: (BuildContext context) => const BottomNavigationBarController()), (Route route) => route == null);
        //     });
        //   }
        } else {
          // snackBar.error("Login Gagal!", result.message, durationSeconds: 2);
        }
      } on Exception catch (e) {
        // setState(() { isDisabled = false; isVerifying = false;});
      }
    } else {
      //-- From Invalid, it must be some required fields are empty
      setState(() {
        _autoValidate = AutovalidateMode.onUserInteraction;
      });
    }
  }
}
