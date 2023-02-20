import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/order/components/Filter.dart';
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
      backgroundColor: color.backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Filter(),
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