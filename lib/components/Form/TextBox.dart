import 'package:flutter/material.dart';
import './TitleText.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class TextBox extends StatefulWidget {
  const TextBox({
    super.key,
    this.title = "",
    this.hint = "",
    this.prefixIcon,
    this.radius,
    this.textInputAction,
  });

  final String title;
  final String hint;
  final double? radius;
  final Widget? prefixIcon;
  final TextInputAction? textInputAction;

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  String get title => widget.title;
  String get hint => widget.hint;
  Widget? prefixIcon() => widget.prefixIcon;
  TextInputAction? textInputAction() => widget.textInputAction;
  double radius() => widget.radius ?? 0;

  var textColor = const Color.fromRGBO(0, 0, 0, 0.65);
  var hintColor = const Color.fromRGBO(0, 0, 0, 0.25);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleText(title: title ?? ""),
        const SizedBox(height: 3,),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          textInputAction: null,
          cursorColor: color.primary,
          onSaved: (email) {},
          style: TextStyle(fontSize: 14, color: textColor),
          decoration: InputDecoration(
            contentPadding: prefixIcon() == null ? const EdgeInsets.all(10) : const EdgeInsets.symmetric(vertical: 10),
            hintText: hint,
            hintStyle: TextStyle(color: hintColor),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(radius()),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:  const BorderSide(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(radius()),
            ),
            prefixIcon: prefixIcon(),
          ),
        ),
      ],
    );
  }
}
