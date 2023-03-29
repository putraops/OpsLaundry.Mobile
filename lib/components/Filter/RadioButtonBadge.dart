import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/filters/FilterObject.dart';

class RadioButtonBadge extends StatefulWidget {
  final List<FilterObject> items;
  final Function(dynamic) callbackResult;

  const RadioButtonBadge({
    super.key,
    required this.items,
    required this.callbackResult,
  });

  @override
  State<RadioButtonBadge> createState() => _RadioButtonBadgeState();
}

class _RadioButtonBadgeState extends State<RadioButtonBadge> {
  int? _selectedValueIndex;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...List.generate(
          widget.items.length,
              (index) => button(
            index: index,
            item: widget.items[index],
          ),
        )
      ],
    );
  }

  void selectValue(int index) {
    var i = widget.items[index];
    setState(() {
      _selectedValueIndex = index;
    });

    widget.callbackResult(i);
  }

  Widget button({required FilterObject item, required int index}) {
    return InkWell(
      splashColor: Colors.cyanAccent,
      onTap: () { selectValue(index); },
      child: Container(
        margin: const EdgeInsets.only(right: 10, bottom: 10),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        decoration: BoxDecoration(
          color: _selectedValueIndex == index ? color.selectedBackgroundColor : Colors.white,
          border: Border.all(color: _selectedValueIndex == index ? color.primary : color.defaultBorderColor,),
          borderRadius: BorderRadius.circular(7.5),
        ),
        child: Text(item.displayName!, style: TextStyle(fontSize: 13, color: _selectedValueIndex == index ? color.primary : color.defaultTextColor)),
      ),
    );
  }
}
