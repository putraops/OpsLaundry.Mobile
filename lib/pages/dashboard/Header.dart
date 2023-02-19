import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

Widget Header(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hi, $name!", style:
        const TextStyle(
            fontSize: 26,
            color: color.titleColor,
            shadows: [
              Shadow(
                offset: Offset(1, 1),
                blurRadius: 5,
                color: Colors.black87,
              ),
            ]
        )
        ),
        const Text("Selamat Datang Kembali", style: TextStyle(fontSize: 16, color: color.titleColor,),)
      ],
    ),
  );
}