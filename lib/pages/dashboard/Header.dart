import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;
import 'package:mobile_apps/models/application_user.dart';

Widget Header(application_user? user) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text("Hi, ${user?.fullname ?? ""}!", style:
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