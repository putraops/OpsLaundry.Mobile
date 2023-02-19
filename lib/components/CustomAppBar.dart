import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

PreferredSize CustomAppBar (BuildContext context, String title, dynamic actions) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(60.0),
    child: AppBar(
      backgroundColor: color.primary,
      title: Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600,),
      ),
      centerTitle: true,
      leading: IconButton(
        color: Colors.white,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: const Icon(Icons.navigate_before, size: 30),
        tooltip: "Kembali",
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: actions,
    ),
  );
}