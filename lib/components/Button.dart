import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class Button extends StatefulWidget {
  final String text;
  final String? loadingText;
  final double? textSize;
  final Color? textColor;
  final FontWeight fontWeight;
  final bool? loading;
  final void Function()? onPress;

  const Button(
    this.text,
    {
      super.key,
      this.loadingText,
      this.textSize,
      this.textColor,
      this.fontWeight = FontWeight.w700,
      this.loading = false,
      this.onPress,
    }
  );

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  String get text => widget.text;
  String? get loadingText => widget.loadingText;
  double get textSize => widget.textSize ?? 15;
  Color get textColor => widget.textColor ?? const Color.fromRGBO(255, 255, 255, 1);
  FontWeight get fontWeight => widget.fontWeight!;
  bool get loading => widget.loading ?? false;
  void Function()? get onPress => widget.onPress;

  var hintColor = const Color.fromRGBO(0, 0, 0, 0.25);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: loading ? null : onPress,
      // style: ElevatedButton.styleFrom(
      //   padding: const EdgeInsets.all(16.0),
      //   minimumSize: const Size(double.infinity, 55),
      //   disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
      // ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(0),
        minimumSize: const Size(double.infinity, 45),
        disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5), // <-- Radius
        ),
      ),
      icon: loading ?
      Container(
        width: 24,
        height: 24,
        padding: const EdgeInsets.all(2.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 3,
        ),
      ) : Container(width: 0,),
      label: Text(loading ? (loadingText ?? text) : text, style: TextStyle(color: textColor, fontSize: textSize, fontWeight: fontWeight, )
      ),
    );
  }
}
