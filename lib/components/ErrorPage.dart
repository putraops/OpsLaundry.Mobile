import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Button.dart';

class ErrorPage extends StatelessWidget {
  final String message;
  final bool? hasButton;
  final String? buttonText;
  final bool? buttonLoading;
  final double? textSize;
  final Color? textColor;
  final FontWeight? fontWeight;
  final void Function()? onPress;

  const ErrorPage({
    required this.message,
    this.buttonText,
    this.hasButton = false,
    this.buttonLoading = false,
    this.textSize,
    this.textColor,
    this.fontWeight = FontWeight.w700,
    this.onPress,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Widget actionSection() {
      return Column(
        children: [
          const SizedBox(height: 10,),
          Button(buttonText ?? "Back to previous page", textSize: textSize, onPress: onPress,)
        ],
      );
    }
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
            Text(message, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),
            if (hasButton!) actionSection(),
          ],
        ),
      ),
    );
  }
}
