import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_apps/components/BottomSheet.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class HeaderBar extends StatefulWidget {
  final double width;
  final double height;

  const HeaderBar({
    super.key,
    required this.height,
    required this.width,
  }) ;

  @override
  State<HeaderBar> createState() => _HeaderBarState();
}

class _HeaderBarState extends State<HeaderBar> {
  var f = NumberFormat.currency(locale: 'eu', decimalDigits: 0, symbol: '');
  final String employeeName = "Putra Ompusunggu";

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0,
        left: 0,
        width: MediaQuery.of(context).size.width,
        height: widget.height,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          margin: const EdgeInsets.only(bottom: 0),
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 5.0),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Pelanggan:", style: TextStyle(fontSize: 12, color: color.defaultTextColor, letterSpacing: -.1)),
                  GestureDetector(
                    onTap: (){
                      bottomSheet(context,
                        "Daftar Pelanggan",
                        const Center(child: Text("Daftar Pelanggan"),),
                        size: 0.8,
                        hasRadius: false
                      );
                    },
                    child: Row(
                      children: [
                        Text(employeeName, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color.fromRGBO(1, 1, 1, 0.8), letterSpacing: -.5)),
                        const Icon(Icons.keyboard_arrow_down, color: Color.fromRGBO(1, 1, 1, 0.8), size: 25),
                      ],
                    )
                  )
                ],
              ),
              const Text("23 Januari 2022", style: TextStyle(fontSize: 11, color: color.defaultTextColor, letterSpacing: -.1)),
            ],
          ),
        )
    );
  }
}