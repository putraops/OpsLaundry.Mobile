import 'package:flutter/material.dart';
import 'package:mobile_apps/components/CustomAppBar.dart';
import 'package:mobile_apps/pages/order/new_order/components/HeaderBar.dart';
import 'package:mobile_apps/pages/order/new_order/components/ListItem.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/pages/order/new_order/components/NewItem.dart';
import 'package:mobile_apps/pages/order/new_order/components/PaymentBar.dart';

class NewOrderPage extends StatefulWidget {
  const NewOrderPage({Key? key}) : super(key: key);

  @override
  State<NewOrderPage> createState() => _NewOrderPageState();
}

List<Widget> items = [
  listSeparator(height: 1),
  const ListItem(),
  const ListItem(),
];

Widget listSeparator({ double? height = 10 }){
  return Container(height: height ?? 10, color: color.backgroundColor,);
}

class _NewOrderPageState extends State<NewOrderPage> {
  final double fixInformationHeight = 50;
  final double fixPaymentHeight = 70;
  late double totalPrice = 53000;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,
        "Pesanan Baru",
        hasElevation: false,
        actions: [
          const NewItem(),
          const SizedBox(width: 15,),
        ]
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: fixInformationHeight, bottom: fixPaymentHeight),
              child: ListView.separated(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  return items[index];
                },
                separatorBuilder: (BuildContext context, int index) => listSeparator(),
              ),
            ),
            HeaderBar(height: fixInformationHeight, width: MediaQuery.of(context).size.width,),
            PaymentBar(height: fixPaymentHeight, width: MediaQuery.of(context).size.width, totalPrice: totalPrice)
          ],
        ),
      ),
    );
  }
}
