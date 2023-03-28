import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  const ErrorPage({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Center(
        child: Column(
          mainAxisAlignment : MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            ClipRRect(
              child: Image.asset("assets/icons/error.png", height: 130, fit: BoxFit.fitWidth,),
            ),
            const SizedBox(height: 20,),
            Text(message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), textAlign: TextAlign.center,)
          ],
        ),
      ),
    );
  }
}
