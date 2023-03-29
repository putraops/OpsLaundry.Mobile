import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/filters/FilterObject.dart';


class CheckBoxButtonBadge extends StatefulWidget {
  final List<FilterObject> items;
  final Function(dynamic) callbackResult;

  const CheckBoxButtonBadge({
    super.key,
    required this.items,
    // this.selected,
    required this.callbackResult,
  });

  @override
  State<CheckBoxButtonBadge> createState() => _CheckBoxButtonBadgeState();
}

class _CheckBoxButtonBadgeState extends State<CheckBoxButtonBadge> {
  late List<FilterObject> selected = [];

  void reselected(bool isSelected, String value) {
    print("Info: $isSelected :: Column: $value");
    if (isSelected) {
      selected.add(widget.items.firstWhere((r) => r.value == value));
    } else {
      selected.removeWhere((r){ return r.value == value; });
    }
    widget.callbackResult(selected);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          widget.items.length, (index) => button(
            index: index,
            item: widget.items[index],
          ),
        )
      ],
    );
  }

  Widget button({required FilterObject item, required int index}) {
    return CheckBoxItem(obj: item, callbackResult: reselected,);
  }
}

class CheckBoxItem extends StatefulWidget {
  final FilterObject obj;
  final bool? isSelected;
  final Function(bool, String) callbackResult;

  const CheckBoxItem({
    super.key,
    required this.obj,
    this.isSelected = false,
    required this.callbackResult,
  });

  @override
  State<CheckBoxItem> createState() => _CheckBoxItemState();
}

class _CheckBoxItemState extends State<CheckBoxItem> {
  int? _selectedValueIndex;
  late bool isSelected = false;

  @override
  void initState() {
    // TODO: implement initState
    isSelected = widget.isSelected ?? false;
    super.initState();
  }

  Future<void> setSelected(value) async {
    setState(() {
      isSelected = !isSelected;
    });
    widget.callbackResult(isSelected, value);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.only(right: 10, bottom: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
            color: isSelected ? color.selectedBackgroundColor : Colors.white,
            border: Border.all(color: isSelected ? color.primary : color.defaultBorderColor,),
            borderRadius: BorderRadius.circular(7.5),
          ),
          child: Text(widget.obj.displayName!, style: TextStyle(fontSize: 13, color: isSelected ? color.primary : color.defaultTextColor)),
        ),
      ),
      onTap: () {
        setSelected(widget.obj.value!);
      },
    );
  }
}

