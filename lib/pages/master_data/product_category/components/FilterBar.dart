import 'package:flutter/material.dart';
import 'package:mobile_apps/components/BottomSheet.dart';
import 'package:mobile_apps/components/Filter/ListActiveStatus.dart';
import 'package:mobile_apps/helper/ActiveStatus.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import'package:mobile_apps/helper/FilterRequest.dart';

class FilterBar extends StatefulWidget {
  final Future Function(FilterRequest) onFilter;

  const FilterBar({
    super.key,
     required this.onFilter,
  });

  @override
  State<FilterBar> createState() => _FilterBarState();
}

class _FilterBarState extends State<FilterBar> {
  late FilterRequest filter;
  ActiveStatus? _activeStatus;
  final double boxSize = 30;
  final double boxRadius = 7.5;

  @override
  void initState() {
    filter = FilterRequest();
    super.initState();
  }

  Future<void> setOrderStatus(ActiveStatus? value) async {
    //print("setOrderStatus");
    //print(value);
    setState(() {
      _activeStatus = value;
    });

    filter.isActive = getStatusCode(value);
    await widget.onFilter(filter);
  }

  Future<void> setOutletId(String? value) async {
    filter.tenantId = value;
    await widget.onFilter(filter);
  }

  Future<void> resetStatus() async {
    setState(() {
      _activeStatus = null;
    });
    widget.onFilter(FilterRequest());
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
              border: Border.all(color: _activeStatus != null ? color.primary : Colors.black12),
              borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
              color: _activeStatus == null ? Colors.transparent : color.selectedBackgroundColor,
            ),
            child: Text("X", style: TextStyle(fontSize: 14, color: _activeStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
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
            if (_activeStatus != null) clearFilter(),
            GestureDetector(
              onTap: () {
                bottomSheet(
                  context,
                  "Cari Berdasarkan Status",
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:
                    ListActiveStatus(
                      selected: _activeStatus,
                      onSelect: (value) async => await setOrderStatus(value),
                    ),
                  ),
                  size: 0.6
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: _activeStatus == null ? color.defaultBorderColor : color.primary),
                  borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
                  color: _activeStatus == null ? Colors.transparent : color.selectedBackgroundColor,
                ),
                child: Row(
                  children: [
                    Text(_activeStatus == null ? "Semua Status" : getStatusName(_activeStatus!), style: TextStyle(fontSize: 13, color: _activeStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, color: _activeStatus == null ? color.defaultTextColor : color.primary, size: 25),
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
          ]
      ),
    );
  }
}