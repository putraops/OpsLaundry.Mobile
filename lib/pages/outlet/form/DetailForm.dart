import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Button.dart';
import 'package:mobile_apps/components/ErrorPage.dart';
import 'package:mobile_apps/components/Form/TextField.dart';
import 'package:mobile_apps/components/LoadingDialog.dart';
import 'package:mobile_apps/components/SkeletonAppend.dart';
import 'package:mobile_apps/models/product_category.dart';
import 'package:mobile_apps/components/AppDialog.dart';
import 'package:mobile_apps/models/tenant.dart';

import 'package:mobile_apps/repository/BaseRepository.dart';

class DetailForm extends StatefulWidget {
  final String? recordId;

  const DetailForm({
    this.recordId,
    super.key
  });

  @override
  State<DetailForm> createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  var repo = BaseRepository("tenant");
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  static const double titleSize = 13;
  late tenant? data = tenant();
  late Future<void> fetch;
  late String errorMessage = "";
  var loading = LoadingDialog();

  @override
  void initState() {
    fetch = initialization();
    super.initState();
  }

  Future<void> initialization() async {
    if (widget.recordId != null) {
      var res = await repo.getById(id: widget.recordId!);
      if (res is String) {
        setState(() { errorMessage = res; });
      } else {
        setState(() {
          data = tenant.fromJson(res);
        });
      }
    }
  }

  Future<void> createOrUpdate() async {
    await loading.show();
    var res = await repo.createOrUpdate(object: data!.toJson());
    await loading.hide();
    if (res is String) {
      setState(() {errorMessage = res; });
    } else {
      setState(() { data = tenant.fromJson(res); });
      await appDialog( DialogType.Success, dialogText: "Berhasil ${widget.recordId == null ? "menambah" : "mengubah"} Outlet.",
          callback: (value) async {
            Navigator.pop(context, {
              "isNew": widget.recordId == null,
              "value": data,
            });
          }
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<void>(
      future: fetch,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const SkeletonAppend(total: 5);
          default:
            if (errorMessage.isNotEmpty) {
              return ErrorPage(message: errorMessage);
            } else {
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
                            hintText: "Contoh: Ops Laundry",
                            hintStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Color.fromRGBO(0, 0, 0, 0.375), letterSpacing: -.5),
                            errorText: "Nama tidak boleh kosong.",
                            border: const UnderlineInputBorder(),
                            borderFocused: const UnderlineInputBorder(
                              borderSide:  BorderSide(color: Color.fromRGBO(13, 110, 253, .75), width: 1.75),
                            ),
                            errorBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.red, width: 1.75),
                            ),
                            value: data?.name ?? "",
                            onSaved: (value) {
                              setState(() {
                                data?.name = value as String;
                              });
                            },
                          ),

                          const SizedBox(height: 20,),
                          Button(data?.id == null ? "Tambah" : "Ubah",
                              loadingText: "Silahkan tunggu....",
                              onPress: () async => {
                                FocusScope.of(context).unfocus(),
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save(),
                                  await createOrUpdate(),
                                }
                              }
                          ),
                        ],
                      ),
                    )
                  ]
              );
            }
        }
      }
    );
  }
}