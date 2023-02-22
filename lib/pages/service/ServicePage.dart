import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/service/components/ServiceView.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({Key? key}) : super(key: key);

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, "Layanan"),
      backgroundColor: color.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                // padding: EdgeInsets.only(top: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20,),
                      Container(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: const ServiceView(),
                      ),
                      const SizedBox(height: 15,),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
