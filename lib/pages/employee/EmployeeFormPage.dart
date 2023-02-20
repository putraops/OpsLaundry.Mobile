import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import './components/EmployeeForm.dart';
import 'package:mobile_apps/components/CircularLoadingIndicator.dart';

class EmployeeFormPage extends StatefulWidget {
  const EmployeeFormPage({Key? key}) : super(key: key);

  @override
  State<EmployeeFormPage> createState() => _EmployeeFormPageState();
}

class _EmployeeFormPageState extends State<EmployeeFormPage> {
  bool isLoading = true;

  Future<void> setIsLoading(bool value) async {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    print("ff");
    await Future.delayed(const Duration(seconds: 1));
    await setIsLoading(false);
    print("ff");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Form Karyawan",
        actions: [
          IconButton(
            color: Colors.white,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            icon: const Icon(Icons.more_horiz),
            tooltip: 'Lihat Selengkapnya',
            onPressed: () async {
              await setIsLoading(false);
            },
          ),
          const SizedBox(width: 7.5,),
        ]
      ),
      body: isLoading ? Center(child: CircularLoadingIndicator(),) : const SingleChildScrollView(child: EmployeeForm(),),
    );
  }
}
