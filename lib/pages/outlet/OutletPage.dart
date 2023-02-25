import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/application_user.dart';
import 'package:mobile_apps/components/GreySeparator.dart';
import 'package:mobile_apps/pages/outlet/components/ListItem.dart';

class OutletPage extends StatefulWidget {
  const OutletPage({Key? key}) : super(key: key);

  @override
  State<OutletPage> createState() => _OutletPageState();
}

List<application_user> tenants = [
  application_user(id: "id", createdAt: DateTime.now(), isDefault: true, organizationName: "Jireh Laundry", tenantName: "Amplas", fullname: "Putra Ompusunggu", initialName: "PO"),
  application_user(id: "id", createdAt: DateTime.now(), isDefault: false, organizationName: "Jireh Laundry", tenantName: "Coin Laundry", fullname: "Bagus Dewa Anggoro", initialName: "BA"),
  application_user(id: "id", createdAt: DateTime.now(), isDefault: false, organizationName: "Jireh Laundry", tenantName: "Amplas 32", fullname: "Naomi Angelina Ompusunggu", initialName: "NO"),
  application_user(id: "id", createdAt: DateTime.now(), isDefault: false, organizationName: "Jireh Laundry", tenantName: "Patumbak", fullname: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", initialName: "NO"),
];

class _OutletPageState extends State<OutletPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: color.backgroundColor,
        appBar: customAppBar(context, title: "Daftar Outlet"),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: const Color.fromRGBO(1, 1, 1, 0.05),
                height: 40,
                child: const Center(
                  child: Text("Filter"),
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: tenants.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        ListItem(tenants[index]),
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
