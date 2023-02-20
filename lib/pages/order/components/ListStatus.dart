import 'package:flutter/material.dart';
import 'package:mobile_apps/helper/OrderStatus.dart';

class ListStatus extends StatefulWidget {
  final OrderStatus? selected;
  final Function(OrderStatus?) onSelect;

  const ListStatus({
    super.key,
    this.selected,
    required this.onSelect
  });

  @override
  State<ListStatus> createState() => _ListStatusState();
}

class _ListStatusState extends State<ListStatus> {
  List<Widget> list = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Column(children: createRadioStatus());
  }

  Future<void> setSelected(OrderStatus? selected) async {
    widget.onSelect(selected);
    Navigator.pop(context);
  }

  Widget item(OrderStatus? value) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async { await setSelected(value); },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(value == null ? "Semua Status" : getStatusName(value), style: const TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.75), fontWeight: FontWeight.w600, letterSpacing: -.5)),
                Transform.scale(
                    scale: 1.15,
                    child: Radio(
                      value: value,
                      groupValue: widget.selected,
                      onChanged: (value) async { await setSelected(value); },
                    )
                ),
              ],
            ),
          ),
        ),
        const Divider(color: Color.fromRGBO(1, 1, 1, 0.25), height: 5,),
      ],
    );
  }

  List<Widget> createRadioStatus() {
    List<Widget> widgets = [
      item(null)
    ];

    for (var name in OrderStatus.values) {
      widgets.add(item(name));
    }
    return widgets;
  }
}
