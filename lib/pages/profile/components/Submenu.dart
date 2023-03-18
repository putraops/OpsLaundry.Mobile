import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
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
                Text(name, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600, letterSpacing: -0.2)),
              ],
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.black, size: 20)
          ],
        ),
        const SizedBox(height: 5,),
      ],
    );
}
