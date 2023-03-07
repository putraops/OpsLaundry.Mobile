import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/components/GreySeparator.dart';
import 'package:mobile_apps/components/SkeletonAppend.dart';
import 'package:mobile_apps/models/product.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobile_apps/components/CustomAlertDialog.dart';
import 'package:mobile_apps/helper/ActiveStatus.dart';
import 'package:mobile_apps/models/product_details.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/Auth.dart';

import 'package:mobile_apps/redux/appState.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:skeletons/skeletons.dart';

class DetailFormPage extends StatefulWidget {
  final product productRecord;
  final product_details? productDetailsRecord;
  // final int index;
  // final Function(String, int)? onDelete;
  // final bool? outletFilter;

  const DetailFormPage({
    required this.productRecord,
    this.productDetailsRecord,
    // this.onDelete,
    // this.outletFilter,
    super.key
  });

  @override
  State<DetailFormPage> createState() => _DetailFormPageState();
}

class _DetailFormPageState extends State<DetailFormPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode? _autoValidate = AutovalidateMode.disabled;
  // late product record;
  late bool isExpanded = false;
  late bool isLoading = false;

  @override
  initState() {
    super.initState();
    // record = widget.record!;
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> fetchServices() async {
    setState(() { isLoading = true; });
    await Future.delayed(const Duration(seconds: 1), () async { setState(() { isLoading = false; });},);
  }

  // void deleteById(String id) async {
  //   await widget.onDelete!(id, widget.index!);
  // }

  FocusNode myFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    final _auth = Auth(email: "", password: "");
    return StoreConnector<AppState, AppState>(
      converter: (store) => store.state,
      builder: (_, state) {
        return Scaffold(
          appBar: customAppBar(context,
              title: "Tambah Detail Barang",
              centerTitle: true,
          ),
          body: Column(
            children: [
              Container(
                width: double.infinity,
                // height: 50,
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                color: const Color.fromRGBO(40, 167, 69, 0.3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text("Nama", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25),),
                        ),
                        const SizedBox(
                          width: 5,
                          child: Text(":", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,)),
                        ),
                        Expanded(
                          child: Text(
                              widget.productRecord?.name ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25)
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 80,
                          child: Text("Description", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25),),
                        ),
                        const SizedBox(
                          width: 5,
                          child: Text(":", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600,)),
                        ),
                        Expanded(
                          child: Text(
                              widget.productRecord?.product_category_description ?? "",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 13, color: Color.fromRGBO(0, 0, 0, 0.75), letterSpacing: -.25)
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    Form(
                      key: formKey,
                      autovalidateMode: _autoValidate,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [

                            const Text("Nama", style: TextStyle(fontSize: 14),),
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
                                  _auth.email = value;
                                });
                              },
                            ),

                            const SizedBox(height: 20,),
                            const Text("Layanan", style: TextStyle(fontSize: 14),),
                            const SizedBox(height: 5,),
                            const Text("Pilih Layanan", style: TextStyle(fontSize: 14),),

                            const SizedBox(height: 20,),
                            const Text("Harga", style: TextStyle(fontSize: 14),),
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
                              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w700, letterSpacing: -1.25, color: Color.fromRGBO(0, 0, 0, 0.75)),
                              border: const UnderlineInputBorder(),
                              borderFocused: const UnderlineInputBorder(
                                borderSide:  BorderSide(color: Color.fromRGBO(13, 110, 253, .75), width: 1.75),
                              ),
                              errorBorder: const UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.red, width: 2),
                              ),
                              onSaved: (value) {
                                print(value);
                                setState(() {
                                  _auth.password = value;
                                });
                              },
                            ),

                            const SizedBox(height: 30,),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                minimumSize: const Size(double.infinity, 50),
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
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );


  }

  void _validateInputs() async {
    print(formKey.currentState!.validate());
    if (formKey.currentState!.validate()) {
      print("valiu");
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
      print("disabled");
      //-- From Invalid, it must be some required fields are empty
      setState(() {
        _autoValidate = AutovalidateMode.onUserInteraction;
      });
    }
  }
}
