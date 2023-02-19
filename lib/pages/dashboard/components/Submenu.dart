import 'package:flutter/material.dart';

class Submenu extends StatefulWidget {
  final String displayName;
  final Image image;
  final Function onPress;

  const Submenu(
      this.displayName,
      this.image,
      this.onPress,
      { super.key }
  );

  @override
  State<Submenu> createState() => _SubmenuState();
}

class _SubmenuState extends State<Submenu> {
  @override
  Widget build(BuildContext context) {
    void calculate() {
      widget.onPress();
    }

    return InkWell(
      // onTap: () {
      //   debugPrint('Pesanan....');
      // },
      splashFactory: NoSplash.splashFactory,
      highlightColor: Colors.transparent,
      onTap: () => calculate(),
      child: Column(
        children: [
          ClipRRect(
            // child: Image.asset("assets/icons/machine-1.png", height: 50, width: 50,),
            child: widget.image,
          ),
          FittedBox(
            fit: BoxFit.fill,
            child: Text(widget.displayName, style: const TextStyle(fontSize: 13)),
          )
        ],
      ),
    );
  }
}
