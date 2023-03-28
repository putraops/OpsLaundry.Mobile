import 'package:flutter/material.dart';
import '../context/GlobalContext.dart';

class AppSnackBar {
  int calculate(double durationSeconds) {
    return (durationSeconds * 1000).round();
  }

  void error(String title, String message, {double? durationSeconds = 4}) {
    ScaffoldMessenger.of(NavigationService.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(0),
        duration: Duration(milliseconds: calculate(durationSeconds!)),
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
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w800, color: Colors.white),
                    ),
                    const SizedBox(height: 7.5,),
                    Text(
                      message,
                      style: const TextStyle( color: Colors.white, fontSize: 15, letterSpacing: -.15,),
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
}

