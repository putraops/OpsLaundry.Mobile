import 'package:flutter/material.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class Avatar extends StatefulWidget {
  final double size;
  final String name;

  const Avatar(this.size, this.name, { super.key });

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.size,
      backgroundColor: color.primary,
      child: FittedBox(
          fit: BoxFit.fill,
          child: Text(
            widget.name,
            // textAlign: TextAlign.justify,
            style: TextStyle(
                color: Colors.white,
                fontSize: widget.size - 2.5,
                fontWeight: FontWeight.w600,
                fontStyle: FontStyle.normal
            ),
          ),
      )
    );
  }
}
