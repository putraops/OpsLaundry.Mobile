import 'package:flutter/material.dart';
import 'package:mobile_apps/components/BottomSheet.dart';
import 'package:mobile_apps/pages/order/components/ListStatus.dart';
import 'package:mobile_apps/helper/OrderStatus.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  OrderStatus? _orderStatus;

  @override
  void initState() {
    super.initState();
  }

  Future<void> setOrderStatus(OrderStatus? value) async {
    setState(() {
      _orderStatus = value;
    });
  }

  Future<void> resetStatus() async {
    setState(() {
      _orderStatus = null;
    });
  }

  Widget clearFilter() {
    return Row(
      children: [
        GestureDetector(
          onTap: () async { await resetStatus(); },
          child: Container(
            padding: const EdgeInsets.only(top: 2.5, bottom: 3, left: 12.5, right: 12.5),
            decoration: BoxDecoration(
              border: Border.all(color: _orderStatus != null ? color.primary : Colors.black12),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: _orderStatus == null ? Colors.transparent : color.selectedBackgroundColor,
            ),
            child: Text("X", style: TextStyle(fontSize: 15, color: _orderStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
          ),
        ),
        const SizedBox(width: 5,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          scrollDirection: Axis.horizontal,
          children: [
            if (_orderStatus != null) clearFilter(),
            GestureDetector(
              onTap: () {
                bottomSheet(
                  context,
                  "Cari Berdasarkan Status",
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:
                    ListStatus(
                      selected: _orderStatus,
                      onSelect: (value) async => await setOrderStatus(value),
                    ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: _orderStatus == null ? color.defaultBorderColor : color.primary),
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  color: _orderStatus == null ? Colors.transparent : color.selectedBackgroundColor,
                ),
                child: Row(
                  children: [
                    Text(_orderStatus == null ? "Semua Status" : getStatusName(_orderStatus!), style: TextStyle(fontSize: 14, color: _orderStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
                    const SizedBox(width: 2.5),
                    Icon(Icons.keyboard_arrow_down, color: _orderStatus == null ? color.defaultTextColor : color.primary, size: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5,),
            Container(
              padding: const EdgeInsets.only(left: 12.5, right: 5.5),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  borderRadius: const BorderRadius.all(Radius.circular(10))
              ),
              child: Row(
                children: const [
                  Text("Semua Outlet", style: TextStyle(fontSize: 14, color: color.defaultTextColor, letterSpacing: -0.15),),
                  SizedBox(width: 2.5),
                  Icon(Icons.keyboard_arrow_down, color: Color(0xFF3D3D3D), size: 25),
                ],
              ),
            ),
          ]
      ),
    );
  }
}