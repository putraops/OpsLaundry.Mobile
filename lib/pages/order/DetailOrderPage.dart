import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/order/components/FilterBar.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/pages/order/components/ListItem.dart';

void main() async {
  runApp(const DetailOrderPage());
}

class DetailOrderPage extends StatefulWidget {
  const DetailOrderPage({Key? key}) : super(key: key);

  @override
  State<DetailOrderPage> createState() => _DetailOrderPageState();
}

class _DetailOrderPageState extends State<DetailOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.backgroundColor,
      appBar: AppBar(
        // backgroundColor: color.primary,
        title: const Text(
          "No Pesanan: JRH-502",
          style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w600,),
        ),
        centerTitle: true,
        leading: IconButton(
          color: Colors.black,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: const Icon(Icons.navigate_before, size: 30),
          tooltip: "Kembali",
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 0.25,
        actions: null,
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Detail Order Page..."),
        ),
      ),
    );
  }
}