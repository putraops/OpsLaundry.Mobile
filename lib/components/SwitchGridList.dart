import 'package:flutter/material.dart';

class SwitchGridList extends StatefulWidget {
  final bool? value;

  const SwitchGridList({
    this.value = false,
    super.key,
  });

  @override
  State<SwitchGridList> createState() => _SwitchGridListState();
}

class _SwitchGridListState extends State<SwitchGridList> {
  late bool switchValue;
  static const _backgroundColor = Colors.grey;
  static const _selectedTextColor = Color.fromRGBO(1, 1, 1, 1);

  @override
  void initState() {
    switchValue = widget.value!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          switchValue = !switchValue;
        });
      },
      child: Container(
        width: 70,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: _backgroundColor
          // color: const Color.fromRGBO(1, 1, 1, 0.6)
        ),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: switchValue ? Colors.white : _backgroundColor),
                child: Center(
                    child: Icon(Icons.grid_view_sharp, color: switchValue ? _selectedTextColor : const Color.fromRGBO(0, 0, 0, 0.5), size: 17)
                ),
              ),
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: switchValue ? _backgroundColor : Colors.white),
                child: Center(
                    child: Center(
                        child: Icon(Icons.view_list, color: switchValue ? const Color.fromRGBO(0, 0, 0, 0.5) : _selectedTextColor, size: 20)
                    )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
