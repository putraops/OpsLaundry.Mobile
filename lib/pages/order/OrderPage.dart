import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile_apps/pages/order/components/FilterBar.dart';
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/pages/order/components/ListItem.dart';
import 'package:mobile_apps/pages/order/components/SearchBar.dart';
import 'package:mobile_apps/components/GreySeparator.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
      statusBarIconBrightness: Brightness.light,
    )
  );
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SearchBar(
                      width: (MediaQuery.of(context).size.width * 0.85) - 15,
                      counterCallback: (value) {
                        print("value: " + value!);
                      },
                    ),
                    Container(
                      width: (MediaQuery.of(context).size.width * 0.15) - 15,
                      alignment: const Alignment(0.99, 0),
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: ClipRRect(
                          child: Image.asset("assets/icons/scanner-black.png", height: 28, width: 28,),
                        ),
                      ),
                    ),
                    // Expanded(
                    //   child: ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Filter(),
                ),
              ),
              Expanded(
                  child: ListView.separated(
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
                    },
                    separatorBuilder: (BuildContext context, int index) => const GreySeparator(),
                  )
              )

            ],
          ),
        ),
      ),
    );
  }
}