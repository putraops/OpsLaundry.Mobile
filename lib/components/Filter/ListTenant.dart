import 'package:flutter/material.dart';
import 'package:mobile_apps/data/dummies.dart';
import 'package:mobile_apps/models/tenant.dart';

class ListTenant extends StatefulWidget {
  final String? selected;
  final Function(String?) onSelect;

  const ListTenant({
    super.key,
    required this.selected,
    required this.onSelect
  });

  @override
  State<ListTenant> createState() => _ListTenantState();
}

class _ListTenantState extends State<ListTenant> {
  List<Widget> list = <Widget>[];
  late List<tenant> tenants;

  @override
  initState() {
    super.initState();
    tenants = tenantDummies;
  }

  @override
  void dispose() {
    tenants = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: createRadioStatus());
  }

  Future<void> setSelected(tenant? selected) async {
    widget.onSelect(selected?.id);
    Navigator.pop(context);
  }

  Widget item(tenant? obj) {
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
                Column(
                  children: [
                    Text(obj == null ? "Semua Outlet" : obj.name!, style: const TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.75), fontWeight: FontWeight.w600, letterSpacing: -.5)),
                    Text(obj == null ? "Semua Outlet" : obj.name!, style: const TextStyle(fontSize: 15, color: Color.fromRGBO(1, 1, 1, 0.75), fontWeight: FontWeight.w600, letterSpacing: -.5)),
                  ],
                ),
                Transform.scale(
                    scale: 1.15,
                    child: Radio(
                      value: obj?.id,
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

    for (var name in tenants) {
      widgets.add(item(name));
    }
    return widgets;
  }
}
