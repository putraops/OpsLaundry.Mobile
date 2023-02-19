import 'package:flutter/material.dart';

Widget Submenu(String name, IconData icon) {
    return Column(
      children: [
        const SizedBox(height: 20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.black54, size: 25),
                const SizedBox(width: 15,),
                Text(name, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, letterSpacing: -0.2)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20)
          ],
        ),
        const SizedBox(height: 5,),
      ],
    );
}

// class Submenu extends StatelessWidget {
//   final String name;
//   // const Submenu({Key? key}) : super(key: key);
//
//   const Avatar(this.name, { super.key });
//
//   @override
//   Widget build(BuildContext context) {

//   }
// }
