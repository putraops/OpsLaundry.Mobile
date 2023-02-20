import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class OutletPage extends StatefulWidget {
  const OutletPage({Key? key}) : super(key: key);

  @override
  State<OutletPage> createState() => _OutletPageState();
}

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: customAppBar(context, "Daftar Outlet"),
      body: Center(
        child: Text("Outlet Page."),
      ),
    );
  }
}
