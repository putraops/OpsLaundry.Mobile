import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

Widget CircularLoadingIndicator () {
  return const CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation<Color>(color.primary),
    backgroundColor: Color.fromRGBO(0, 0, 0, 0.1),
  );
}
