import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class TitleText extends StatefulWidget {
  const TitleText({
    super.key,
    this.title = "",
  });

  final String title;

  @override
  State<TitleText> createState() => _TitleTextState();
}

class _TitleTextState extends State<TitleText> {
  String get title => widget.title;
  var textColor = const Color.fromRGBO(0, 0, 0, 0.65);
  var hintColor = const Color.fromRGBO(0, 0, 0, 0.25);

  @override
  Widget build(BuildContext context) {
    return Text(title ?? "", style: TextStyle(fontSize: 12, color: textColor, fontWeight: FontWeight.w600,),);
  }
}
