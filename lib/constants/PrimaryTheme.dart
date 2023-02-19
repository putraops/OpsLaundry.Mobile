import 'dart:ui';
import 'package:flutter/material.dart';

ThemeData PrimaryTheme() {
  Map<int, Color> color =
  {
    50: const Color.fromRGBO(210, 41, 41, .1),
    100:const Color.fromRGBO(210, 41, 41, .2),
    200:const Color.fromRGBO(210, 41, 41, .3),
    300:const Color.fromRGBO(210, 41, 41, .4),
    400:const Color.fromRGBO(210, 41, 41, .5),
    500:const Color.fromRGBO(210, 41, 41, .6),
    600:const Color.fromRGBO(210, 41, 41, .7),
    700:const Color.fromRGBO(210, 41, 41, .8),
    800:const Color.fromRGBO(210, 41, 41, .9),
    900:const Color.fromRGBO(210, 41, 41, 1),
  };
  MaterialColor colorCustom = MaterialColor(0xFFFFFFFF, color);

  return ThemeData(
    primarySwatch: colorCustom,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    fontFamily: "Poppins",
  );
}