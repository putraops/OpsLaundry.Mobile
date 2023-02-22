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
  final double boxSize = 30;
  final double boxRadius = 7.5;

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
            padding: const EdgeInsets.only(top: 3.5, bottom: 3, left: 12.5, right: 12.5),
            height: boxSize,
            decoration: BoxDecoration(
              border: Border.all(color: _orderStatus != null ? color.primary : Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
              color: _orderStatus == null ? Colors.transparent : color.selectedBackgroundColor,
            ),
            child: Text("X", style: TextStyle(fontSize: 14, color: _orderStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
          ),
        ),
        const SizedBox(width: 5,),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: boxSize,
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
                  size: 0.6
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: _orderStatus == null ? color.defaultBorderColor : color.primary),
                  borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
                  color: _orderStatus == null ? Colors.transparent : color.selectedBackgroundColor,
                ),
                child: Row(
                  children: [
                    Text(_orderStatus == null ? "Semua Status" : getStatusName(_orderStatus!), style: TextStyle(fontSize: 13, color: _orderStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, color: _orderStatus == null ? color.defaultTextColor : color.primary, size: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: () {
                bottomSheet(
                  context,
                  "Pilih Outlet",
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      heightFactor: 3,
                      child: Text("Pilih Outlet"),
                    ),
                  ),
                  size: 0.6
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.all(Radius.circular(boxRadius))
                ),
                child: Row(
                  children: const [
                    Text("Semua Outlet", style: TextStyle(fontSize: 13, color: color.defaultTextColor, letterSpacing: -0.15),),
                    SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, color: Color(0xFF3D3D3D), size: 25),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 5,),
            GestureDetector(
              onTap: () {
                bottomSheet(
                  context,
                  "Pilih Tanggal",
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Center(
                      heightFactor: 3,
                      child: Text("Pilih Tanggal"),
                    ),
                  ),
                  size: 0.6
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: color.defaultBorderColor),
                  borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
                  color: Colors.transparent,
                ),
                child: Row(
                  children: const [
                    Text("Semua Tanggal", style: TextStyle(fontSize: 13, color: color.defaultTextColor, letterSpacing: -0.15),),
                    SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, color: color.defaultTextColor, size: 25),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}