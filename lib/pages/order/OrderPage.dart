import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/components/CircularLoadingIndicator.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/pages/order/components/ListItem.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        //Lets make the Status Bar Transparent
        statusBarColor: Colors.white,
        //Lets make the status bar icon brightness to bright
        statusBarIconBrightness: Brightness.dark,
      )
  );

  //WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(const OrderPage());
}

class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

List<application_user> Users = [
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
];



class _OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor: color.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 50,
              // color: color.backgroundColor,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 3.5, bottom: 3, left: 12.5, right: 5.5),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black12),
                        borderRadius: const BorderRadius.all(Radius.circular(15))
                    ),
                    child: Row(
                      children: const [
                        Text("Semua Status", style: TextStyle(fontSize: 13, letterSpacing: -0.15),),
                        SizedBox(width: 2.5),
                        Icon(Icons.keyboard_arrow_down, color: Color(0xFF3D3D3D), size: 25),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5,),
                  // This place for selected filted
                ],
              ),
            ),
            Expanded(
                child: ListView.builder(
                    itemCount: 15, // _posts.length + (_isLastPage ? 0 : 1),
                    itemBuilder: (context, index) {

                      // if (index == _posts.length - _nextPageTrigger) {
                      //   fetchData();
                      // }
                      // if (index == _posts.length) {
                      //   if (_error) {
                      //     return Center(
                      //         child: errorDialog(size: 15)
                      //     );
                      //   } else {
                      //     return const Center(
                      //         child: Padding(
                      //           padding: EdgeInsets.all(8),
                      //           child: CircularProgressIndicator(),
                      //         ));
                      //   }
                      // }
                      // final Post post = _posts[index];
                      return Column(
                        children: [
                          ListItem(Users[index]),
                          const SizedBox(height: 10.0,),
                        ],
                      );
                    }
                )
            )

          ],
        ),
      ),
    );
  }
}

  // bool isLoading = true;
  //
  // Future<void> setIsLoading(bool value) async {
  //   setState(() {
  //     isLoading = value;
  //   });
  // }
  //
  // @override
  // void initState() {
  //   print("initialization");
  //   super.initState();
  //   initialization();
  // }
  //
  // void initialization() async {
  //   await Future.delayed(const Duration(milliseconds: 1500));
  //   await setIsLoading(false);
  //   print("ready...");
  // }
  //
  // @override
  // Widget build(BuildContext context) {
  //   List<application_user> Users = [
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  //     application_user(id: "id", createdAt: DateTime.now(), organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
  //   ];
  //
  //   return SafeArea(
  //     child: isLoading ?
  //       Center(child: CircularLoadingIndicator(),) :
  //       Scaffold(
  //         backgroundColor: color.backgroundColor,
  //         // backgroundColor: Theme.of(context).primaryColorDark,
  //         body: SafeArea(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             crossAxisAlignment: CrossAxisAlignment.stretch,
  //             children: <Widget>[
  //               Container(
  //                 height: 50,
  //                 color: color.backgroundColor,
  //                 padding: const EdgeInsets.symmetric(horizontal: 15),
  //                 child: Row(
  //                   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                   children: [
  //                     Container(
  //                       padding: const EdgeInsets.only(top: 3.5, bottom: 3, left: 12.5, right: 15),
  //                       decoration: BoxDecoration(
  //                           border: Border.all(color: Colors.black12),
  //                           borderRadius: const BorderRadius.all(Radius.circular(15))
  //                       ),
  //                       child: Row(
  //                         children: const [
  //                           Icon(Icons.filter_alt_rounded, color: Color(0xFF3D3D3D), size: 15),
  //                           SizedBox(width: 2.5),
  //                           Text("Filter", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: -0.15),)
  //                         ],
  //                       ),
  //                     ),
  //                     const SizedBox(width: 5,),
  //                     // This place for selected filted
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: ListView.builder(
  //                     itemCount: Users.length,
  //                     itemBuilder: (BuildContext context, int index) {
  //                       return Column(
  //                         children: [
  //                           ListItem(Users[index]),
  //                           const SizedBox(height: 10,),
  //                           // const Divider(color: Colors.black12, height: 1),
  //                         ],
  //                       );
  //                     }
  //                 ),
  //               ),
  //             ],
  //           )
  //         ),
  //       ),
  //   );
  // }
// }