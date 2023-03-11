import 'package:flutter/material.dart';
import 'package:mobile_apps/commons/FilterObj.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class CheckBoxButtonBadge extends StatefulWidget {
  final List<FilterObj> items;
  final List<String>? selected;

  const CheckBoxButtonBadge({
    super.key,
    required this.items,
    this.selected,
  });

  @override
  State<CheckBoxButtonBadge> createState() => _CheckBoxButtonBadgeState();
}

class _CheckBoxButtonBadgeState extends State<CheckBoxButtonBadge> {
  void selected(value) {
    print(value);
  }

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

  Widget button({required FilterObj item, required int index}) {
    return CheckBoxItem(title: item.value,);
  }
}

class CheckBoxItem extends StatefulWidget {
  final String title;
  final bool? isSelected;

  const CheckBoxItem({
    super.key,
    required this.title,
    this.isSelected = false,
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
    isSelected = widget?.isSelected ?? false;
    super.initState();
  }

  Future<void> setSelected() async {
    setState(() {
      isSelected = !isSelected;
    });
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
          child: Text(widget.title, style: TextStyle(fontSize: 13, color: isSelected ? color.primary : color.defaultTextColor)),
        ),
      ),
      onTap: () {
        setSelected();
      },
    );
  }
}

