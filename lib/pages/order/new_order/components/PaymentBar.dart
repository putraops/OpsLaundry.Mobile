import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class PaymentBar extends StatefulWidget {
  final double width;
  final double height;
  final double totalPrice;

  const PaymentBar({
    super.key,
    required this.height,
    required this.width,
    required this.totalPrice,
  }) ;

  @override
  State<PaymentBar> createState() => _PaymentBarState();
}

class _PaymentBarState extends State<PaymentBar> {
  var f = NumberFormat.currency(locale: 'eu', decimalDigits: 0, symbol: '');

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      width: widget.width,
      height: widget.height,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Color.fromRGBO(0, 0, 0, 0.3), blurRadius: 5.0),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Total Harga", style: TextStyle(fontSize: 13, letterSpacing: -.25),),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rp ", style: TextStyle(fontSize: 10, color: color.primary, fontWeight: FontWeight.w600)),
                    Text(widget.totalPrice == 0 ? "-" : f.format(widget.totalPrice), style: const TextStyle(fontSize: 15.5, color: color.primary, fontWeight: FontWeight.w600, letterSpacing: -.25),),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color.primary,
                padding: EdgeInsets.symmetric(horizontal: widget.width * 0.15),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
              ),
              child: const Text('Lanjut', style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -.3)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}


// // ignore: non_constant_identifier_names
// Widget PaymentBar(double totalPrice, { required double width, required double height }) {
//   var f = NumberFormat.currency(locale: 'eu', decimalDigits: 0, symbol: '');
//
//
// }