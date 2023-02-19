import 'package:flutter/material.dart';

class CenteredText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;

  const CenteredText({
    super.key,
    required this.text,
    fontSize,
    fontWeight
  }) :  fontSize = fontSize ?? 16.0,
        fontWeight = fontWeight ?? FontWeight.normal;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
class FormTitleText extends StatelessWidget {
  final String text;
  final EdgeInsets padding;
  const FormTitleText({
    super.key,
    required this.text,
    padding
  }) : padding = padding ?? const EdgeInsets.only(top: 8.0, bottom: 8.0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2,
      ),
    );
  }
}