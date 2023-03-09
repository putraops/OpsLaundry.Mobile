import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/models/product_details.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/components/BottomSheet.dart';

class ProductDetailForm extends StatefulWidget {
  final product_details? productDetailsRecord;

  const ProductDetailForm({
    this.productDetailsRecord,
    super.key
  });

  @override
  State<ProductDetailForm> createState() => _ProductDetailFormState();
}

class _ProductDetailFormState extends State<ProductDetailForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? _autoValidate = AutovalidateMode.disabled;
  late bool isLoading = false;
  late bool isServiceIdEmpty = false;
  static const double titleSize = 13;
  final obj = product_details(id: "", itemName: '', itemPrice: 0);

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
                hintText: "Contoh: Express 1 Hari",
                hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.375), letterSpacing: -.5),
                errorText: "Nama tidak boleh kosong.",
                border: const UnderlineInputBorder(),
                borderFocused: const UnderlineInputBorder(
                  borderSide:  BorderSide(color: Color.fromRGBO(13, 110, 253, .75), width: 1.75),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 1.75),
                ),
                onSaved: (value) {
                  print(value);
                  setState(() {
                    obj.itemName = value;
                  });
                },
              ),

              const SizedBox(height: 20,),
              const Text("Layanan", style: TextStyle(fontSize: titleSize),),
              const SizedBox(height: 5,),

              GestureDetector(
                onTap: () {
                  setState(() { isServiceIdEmpty = false; });
                  FocusManager.instance.primaryFocus?.unfocus();
                  bottomSheet(
                      context,
                      "Pilih Layanan",
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Center(
                          child: Text("Text"),
                        ),
                      ),
                      size: 0.6,
                      hasRadius: false
                  );
                },
                child: const Text("Pilih Layanan", style: TextStyle(fontSize: 13, color: color.primary),),
              ),

              if (isServiceIdEmpty) (
                  Column(
                    children: const [
                      SizedBox(height: 2.5,),
                      Text("Layanan tidak boleh kosong.", style: TextStyle(fontSize: 13, color: color.primary),),
                    ],
                  )
              ),


              const SizedBox(height: 20,),
              const Text("Harga", style: TextStyle(fontSize: titleSize),),
              InputField(
                validate: true,
                isDense: true,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                contentPadding: const EdgeInsets.only(top: 0, bottom: 5),
                floatingLabelBehavior: FloatingLabelBehavior.never,
                hintText: "Contoh: 25.000",
                hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.375), letterSpacing: -.5),
                errorText: "Harga tidak boleh kosong.",
                style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, letterSpacing: -1.25, color: Color.fromRGBO(0, 0, 0, 0.75)),
                border: const UnderlineInputBorder(),
                borderFocused: const UnderlineInputBorder(
                  borderSide:  BorderSide(color: Color.fromRGBO(13, 110, 253, .75), width: 1.75),
                ),
                errorBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
                onSaved: (value) {
                  setState(() {
                    obj.itemPrice =  double.parse(value);
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
    bool isValid = true;

    print(formKey.currentState!.validate());
    if (obj.serviceId == null) {
      isValid = false;
      setState(() { isServiceIdEmpty = true; });
    }

    if (formKey.currentState!.validate() && isValid) {
      formKey.currentState!.save();
      setState(() { isLoading = true; });
      await Future.delayed(const Duration(seconds: 1), () async { setState(() { isLoading = false; });},);

      try {
        // StandardResult result = await AuthService().login(_auth);
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
          // setState(() { isDisabled = false; isVerifying = false;});
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
