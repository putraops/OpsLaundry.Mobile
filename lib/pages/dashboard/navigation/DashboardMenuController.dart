import 'package:flutter/material.dart';
import 'package:mobile_apps/pages/dashboard/components/Submenu.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';
import 'package:mobile_apps/pages/employee/EmployeePage.dart';
import 'package:mobile_apps/pages/outlet/OutletPage.dart';
import 'package:mobile_apps/pages/service/ServicePage.dart';
import 'package:mobile_apps/pages/master_data/MasterDataPage.dart';
import 'package:mobile_apps/components/BottomSheet.dart';

class DashboardMenuController extends StatefulWidget {
  const DashboardMenuController({super.key});

  @override
  State<DashboardMenuController> createState() => _DashboardMenuController();
}

class MenuData {
  MenuData(this.image, this.title);
  final Image image;
  final String title;
}

class _DashboardMenuController extends State<DashboardMenuController> {
  @override
  Widget build(BuildContext context) {
    List<Widget> menu = [
      Submenu("Scan QR", Image.asset("assets/icons/scanner-black-64.png", height: 50, width: 50,), () => {
        debugPrint("Ambil...")
      }),
      Submenu("Pesanan", Image.asset("assets/icons/washing-machine.png", height: 50, width: 50,), () => {
        debugPrint("Pesanan...")
      }),
      Submenu("Layanan", Image.asset("assets/icons/laundry-basket.png", height: 50, width: 50,), () => {
        Navigator.of(context).push(AnimateNavigation(const ServicePage()))
      }),
      Submenu("Outlet", Image.asset("assets/icons/store.png", height: 50, width: 50,), () => {
        Navigator.of(context).push(AnimateNavigation(const OutletPage()))
      }),
      Submenu("Pelanggan", Image.asset("assets/icons/customer.png", height: 50, width: 50,), () => {
        debugPrint("Pelanggan...")
      }),
      Submenu("Karyawan", Image.asset("assets/icons/name-tag.png", height: 50, width: 50,), () => {
        Navigator.of(context).push(AnimateNavigation(const EmployeePage()))
      }),
      Submenu("Master Data", Image.asset("assets/icons/document.png", height: 50, width: 50,), () => {
        bottomSheet(context,
          "Master Data",
          const MasterDataPage(),
          size: 1.005,
          hasRadius: false
        )
      }),
      Submenu("Lainnya", Image.asset("assets/icons/four-squares.png", height: 50, width: 50,), () => {
        bottomSheet(
          context,
          "Menu Lainnya",
          const Center(child: Text("A"),),
          size: 0.8
        )
      }),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        children: [
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: menu.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: MediaQuery.of(context).orientation == Orientation.portrait ? 1 : 2,
                crossAxisCount: 4,
                crossAxisSpacing: 5.0,
                mainAxisSpacing: 5.0
            ),
            itemBuilder: (BuildContext context, int index) {
              return Center(child: menu[index]);
            },
          ),
        ],
      ),
    );
  }
}