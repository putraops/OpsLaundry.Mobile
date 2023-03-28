import 'package:flutter/material.dart';
import 'package:mobile_apps/components/BottomSheet.dart';
import 'package:mobile_apps/components/Filter/ListActiveStatus.dart';
import 'package:mobile_apps/components/Filter/ListOrganization.dart';
import 'package:mobile_apps/constants/ActiveStatus.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/helper/FilterRequest.dart';
import 'package:mobile_apps/models/organization.dart';
import 'package:mobile_apps/components/Form/RadioButtonBadge.dart';
import 'package:mobile_apps/components/Form/CheckBoxButtonBadge.dart';
import 'package:mobile_apps/commons/FilterObj.dart';

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
  organization? _organization;
  final double boxSize = 30;
  final double boxRadius = 7.5;

  @override
  void initState() {
    filter = FilterRequest();
    super.initState();
  }

  Future<void> setOrderStatus(ActiveStatus? value) async {
    setState(() {
      _activeStatus = value;
    });

    filter.isActive = getStatusCode(value);
    await widget.onFilter(filter);
  }

  Future<void> setOrganization(organization? value) async {
    setState(() {
      _organization = value;
    });
    filter.organizationId = value?.id;
    await widget.onFilter(filter);
  }

  Future<void> resetStatus() async {
    setState(() {
      _activeStatus = null;
      _organization = null;
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
            if (_organization != null || _activeStatus != null) clearFilter(),
            GestureDetector(
              onTap: () {
                bottomSheet(
                  context,
                  "Cari Berdasarkan Status",
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const Text("Urutkan", style: TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.8), fontWeight: FontWeight.w600, letterSpacing: -0.5)),
                        const SizedBox(height: 7.5,),

                        RadioButtonBadge(
                          items: [
                            FilterObj(key: "newest", value: "Terbaru"),
                            FilterObj(key: "name_asc", value: "Nama Abjad Terkecil"),
                            FilterObj(key: "name_desc", value: "Nama Abjad Terbesar"),
                          ]
                        ),

                        const SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Kategori", style: TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.8), fontWeight: FontWeight.w600, letterSpacing: -0.5)),
                            // Text("Lihat Semua", style: TextStyle(fontSize: 12, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -0.5)),
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
                              child: const Text("Lihat Semua", style: TextStyle(fontSize: 12, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -0.5)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7.5,),
                        CheckBoxButtonBadge(
                          items: [
                            FilterObj(key: "1", value: "Sepatu"),
                            FilterObj(key: "2", value: "Celana"),
                            FilterObj(key: "3", value: "Jas"),
                          ]
                        ),
                      ],
                    )
                  ),
                  size: 0.75,
                  dismissSize: 0.4,
                  hasRadius: false,
                  hasAction: true,
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
                    Text(_activeStatus == null ? "Filter" : getStatusName(_activeStatus!), style: TextStyle(fontSize: 13, color: _activeStatus == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
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
                  "Pilih Organisasi",
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child:
                    ListOrganization(
                      selected: _organization,
                      onSelect: (value) async => await setOrganization(value),
                    ),
                  ),
                  size: 0.75,
                  hasRadius: false
                );
              },
              child: Container(
                padding: const EdgeInsets.only(left: 12.5, right: 5.5),
                decoration: BoxDecoration(
                  border: Border.all(color: _organization == null ? color.defaultBorderColor : color.primary),
                  borderRadius: BorderRadius.all(Radius.circular(boxRadius)),
                  color: _organization == null ? Colors.transparent : color.selectedBackgroundColor,
                ),
                child: Row(
                  children: [
                    Text(_organization?.name ?? "Semua Organisasi", style: TextStyle(fontSize: 13, color: _organization == null ? color.defaultTextColor : color.primary, letterSpacing: -0.15),),
                    const SizedBox(width: 2),
                    Icon(Icons.keyboard_arrow_down, color: _organization == null ? color.defaultTextColor : color.primary, size: 25),
                  ],
                ),
              ),
            ),
          ]
      ),
    );
  }
}