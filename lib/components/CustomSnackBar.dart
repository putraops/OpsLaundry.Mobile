import 'package:flutter/material.dart';
import '../context/GlobalContext.dart';

void error(String title, String message, {int? durationSeconds = 0}) {
  ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(0),
      duration: Duration(seconds: durationSeconds == null || durationSeconds! == 0 ? 4 : durationSeconds!),
      elevation: 0,
      content: Container(
        padding: const EdgeInsets.all(0),
        height: 90,
        decoration: const BoxDecoration(
            color: Color(0xFFC72C41),
            borderRadius: BorderRadius.all(Radius.circular(5))
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800, color: Colors.white),
                  ),
                  const SizedBox(height: 7.5,),
                  Text(
                    message,
                    style: const TextStyle( color: Colors.white, fontSize: 14, letterSpacing: 0 ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              )
            ),
            Positioned(
              top: 15,
              right: 15,
              width: 25,
              height: 25,
              child: Image.asset("assets/icons/warning.png", opacity: const AlwaysStoppedAnimation(.8),),
            ),
          ],
        ),
      ),
    )
  );
}