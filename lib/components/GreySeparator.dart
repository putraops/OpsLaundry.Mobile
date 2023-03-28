import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class GreySeparator extends StatelessWidget {
  final double? height;

  const GreySeparator({
    super.key,
    this.height = 5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(height: height, color: color.backgroundColor,);
  }
}
