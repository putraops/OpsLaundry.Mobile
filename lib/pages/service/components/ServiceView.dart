import 'package:flutter/material.dart';
import 'package:mobile_apps/pages/service/components/ServiceItem.dart';

class ServiceView extends StatefulWidget {
  const ServiceView({Key? key}) : super(key: key);

  @override
  State<ServiceView> createState() => _ServiceViewState();
}

class _ServiceViewState extends State<ServiceView> {
  @override
  Widget build(BuildContext context) {
    bool isList = true;

    List<Widget> menu = [
      // ServiceItem(isList, "Setrika", "Layanan hanya untuk Setrika.", Image.asset("assets/icons/iron.png", height: 30, width: 30,), (){},),
      ServiceItem(
        isList,
        "Cuci Setrika", ""
        "Pencucian dilanjutkan dengan Setrika.",
        Image.asset("assets/icons/washing-machine.png"),
        (){},
      ),
      ServiceItem(
        isList,
        "Cuci Lipat",
        "Pencucian tanpa dilanjutkan dengan Setrika.",
        Image.asset("assets/icons/laundry.png"),
        (){},
      ),
      ServiceItem(
        isList,
        "Cuci Kering / Dry Cleaning",
        "Pencucian dengan menggunakan teknik khusus.",
        Image.asset("assets/icons/dry-cleaning.png"),
        (){},
      ),
      ServiceItem(
        isList,
        "Setrika",
        "Layanan hanya untuk Setrika.",
        Image.asset("assets/icons/iron.png"),
        (){},
      ),
    ];

    if (isList) {
      return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        // Let the ListView know how many items it needs to build.
        itemCount: menu.length,
        // Provide a builder function. This is where the magic happens.
        // Convert each item into a widget based on the type of item it is.
        itemBuilder: (context, index) {
          final item = menu[index];

          return item;
        },
      );
    } else {
      return GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: menu.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? (1 / .8) : 2,
            crossAxisCount: 2,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black12,
            // padding: const EdgeInsets.all(15),
            child: Container(child: menu[index]),
          );
        },
      );
    }
  }
}
