import 'package:flutter/material.dart';
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
      appBar: null,
      backgroundColor: color.primary,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: Container(
                      width: 65,
                      color: color.primary,
                      alignment: Alignment.center,
                      child: const Icon(Icons.arrow_back_ios, color: Colors.white, size: 20,),
                    ) ,
                  ),

                  const Text('Master', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600,)),

                  GestureDetector(
                    onTap: () { Navigator.pop(context); },
                    child: Container(
                      width: 65,
                      color: color.primary,
                      alignment: Alignment.center,
                      child: Transform(
                        transform: Matrix4.translationValues(-7.5, 5, 0),
                        child: const Icon(Icons.more_horiz, color: Colors.white, size: 20),
                      ),
                    ) ,
                  ),
                ],
              ),
            ),
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
