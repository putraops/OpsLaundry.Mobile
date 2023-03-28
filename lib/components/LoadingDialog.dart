import 'package:flutter/material.dart';
import 'package:mobile_apps/components/Button.dart';
import 'package:mobile_apps/components/CircularLoadingIndicator.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/constants/color.dart' as color;

class LoadingDialog {

  late BuildContext _context;
  LoadingDialog() {
    _context = NavigationService.navigatorKey.currentState!.context!;
  }

  Future<void> show() async {
    showDialog(
      barrierDismissible: false,
      context: _context,
      builder: (BuildContext context) => const DialogOverlay(),
    );
  }
  Future<void> hide() async {
    Navigator.pop(_context);
  }
}


class DialogOverlay extends StatefulWidget {
  const DialogOverlay({super.key,});

  @override
  State<StatefulWidget> createState() => DialogOverlayState();
}

class DialogOverlayState extends State<DialogOverlay> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: Duration.zero);
    scaleAnimation =  CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    height: 100,
                    child: CircularLoadingIndicator(),
                  ),
                  const SizedBox(height: 25,),
                  const Text("Sedang diproses...", style: TextStyle(fontSize: 15), textAlign: TextAlign.center),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}