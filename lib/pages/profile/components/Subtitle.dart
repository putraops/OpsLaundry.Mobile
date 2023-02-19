import 'package:flutter/material.dart';

Widget Subtitle(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(name, style: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 18,
        letterSpacing: -0.5
    )),
  );
}