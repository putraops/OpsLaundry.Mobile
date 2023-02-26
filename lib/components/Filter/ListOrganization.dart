import 'package:flutter/material.dart';
import 'package:mobile_apps/data/dummies.dart';
import 'package:mobile_apps/models/organization.dart';

class ListOrganization extends StatefulWidget {
  final organization? selected;
  final Function(organization?) onSelect;

  const ListOrganization({
    super.key,
    required this.selected,
    required this.onSelect
  });

  @override
  State<ListOrganization> createState() => _ListOrganizationState();
}

class _ListOrganizationState extends State<ListOrganization> {
  List<Widget> list = <Widget>[];
  late List<organization> organizations;

  @override
  initState() {
    super.initState();
    organizations = organizationDummies;
  }

  @override
  void dispose() {
    organizations = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: createRadioStatus());
  }

  Future<void> setSelected(organization? selected) async {
    widget.onSelect(selected);
    Navigator.pop(context);
  }

  Widget item(organization? obj) {
    return Column(
      children: [
        GestureDetector(
          onTap: () async { await setSelected(obj); },
          child: Container(
            width: double.infinity,
            height: 50,
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(obj == null ? "Semua Organisasi" : obj.name!, style: const TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.75), fontWeight: FontWeight.w600, letterSpacing: -.5)),
                Transform.scale(
                    scale: 1.15,
                    child: Radio(
                      value: obj,
                      groupValue: widget.selected,
                      onChanged: (value) async { await setSelected(obj); },
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

    for (var name in organizations) {
      widgets.add(item(name));
    }
    return widgets;
  }
}
