import 'package:flutter/material.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/constants/color.dart' as color;

enum DialogType {
  // ignore: constant_identifier_names
  Success,
  // ignore: constant_identifier_names
  Warning,
  // ignore: constant_identifier_names
  Confirm,
}

appDialog(
  DialogType type,
  {
    required String dialogText,
    String? description,
    bool? hasCloseButton = false,
    bool? hasDescription = true,
    Function(bool)? callback,
    String? buttonText
  }
) {
  var context = NavigationService.navigatorKey.currentState!.context!;

  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) => DialogOverlay(
      type,
      dialogText,
      description,
      hasCloseButton: hasCloseButton,
      hasDescription: hasDescription,
      callback: callback,
      buttonText: buttonText,
    ),
  );
}

class DialogOverlay extends StatefulWidget {
  final DialogType dialogType;
  final String? dialogText;
  final String? description;


  final bool? hasCloseButton;
  final bool? hasDescription;
  final Function(bool)? callback;
  final String? buttonText;

  const DialogOverlay(
    this.dialogType,
    this.dialogText,
    this.description,
    {
      super.key,
      this.hasCloseButton = false,
      this.hasDescription = true,
      this.callback,
      this.buttonText
    }
  );

  @override
  State<StatefulWidget> createState() => DialogOverlayState();
}

class DialogOverlayState extends State<DialogOverlay> with SingleTickerProviderStateMixin {
  DialogType get dialogType => widget.dialogType;
  late String? dialogText = widget.dialogText;
  late String description = widget.description ?? "Jika dihapus maka tidak akan bisa kembalikan lagi!";
  late AnimationController controller;
  late Animation<double> scaleAnimation;


  @override
  void initState() {
    super.initState();

    controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 300));
    scaleAnimation =  CurvedAnimation(parent: controller, curve: Curves.elasticInOut);

    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    String? buttonText;
    var isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    double maxWidth = (MediaQuery.of(context).size.width) - 30;
    double maxHeight = (MediaQuery.of(context).size.height) * (isLandscape ? 1 : 0.7);

    double imageHeight = maxHeight > 400 ? 150 : 120;
    Color? buttonBackgroundColor;

    String imageUrl = "";
    switch(dialogType) {
      case DialogType.Success:
        imageUrl = "assets/icons/checkmark.png";
        buttonText = "OK";
        buttonBackgroundColor = color.success;
        break;
      case DialogType.Warning:
        imageUrl = "assets/icons/error.png";
        buttonText = "COBA LAGI";
        buttonBackgroundColor = color.primary;
        break;
      case DialogType.Confirm:
        imageUrl = "assets/icons/question-mark.png";
        buttonText = "OK";
        break;
    }

    List<Widget> renderText() {
      switch(dialogType) {
        case DialogType.Success:
          imageUrl = "assets/icons/checkmark.png";
          buttonText = "OK";
          buttonBackgroundColor = color.success;
          break;
        case DialogType.Warning:
          imageUrl = "assets/icons/error.png";
          buttonText = "COBA LAGI";
          buttonBackgroundColor = color.primary;
          break;
        case DialogType.Confirm:
          imageUrl = "assets/icons/question-mark.png";
          break;
      }

      return [
        const SizedBox(height: 10,),
        Text(dialogText ?? "",
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center
        ),
      ];
    }
    List<Widget> renderButton() {
      var textStyle = const TextStyle(
          color: Color.fromRGBO(255, 255, 255, 1),
          fontSize: 15,
          fontWeight: FontWeight.w700,
          letterSpacing: -.25
      );

      switch(dialogType) {
        case DialogType.Success:
        case DialogType.Warning:
          return [
            const SizedBox(height: 20,),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  minimumSize: const Size(double.infinity, 50),
                  disabledBackgroundColor: const Color.fromRGBO(170, 170, 170, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // <-- Radius
                  ),
                  backgroundColor: buttonBackgroundColor
              ),
              onPressed: () { Navigator.pop(context); (widget.callback == null ? () {} : widget.callback!(true)); },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(buttonText ?? "", style: textStyle),
                ],
              ),
            ),
          ];
        case DialogType.Confirm:
          final ButtonStyle flatButtonStyle = TextButton.styleFrom(
            foregroundColor: color.primary,
            minimumSize: const Size(75, 35),
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(2.0)),
            ),
          );
          return [
            if (widget.hasDescription ?? true) (
              Column(
                children: [
                  const SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(description, textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 14, color: color.defaultTextColor)),
                  ),
                ],
              )
            ),
            const SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () => { Navigator.pop(context), (widget.callback == null ? () {} : widget.callback!(true)), },
                  child: const Text('Ya'),
                ),
                TextButton(
                  style: flatButtonStyle,
                  onPressed: () => { Navigator.pop(context), },
                  child: const Text('Tidak'),
                ),
              ],
            )
          ];
      }
    }

    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            decoration: ShapeDecoration(color: Colors.white, shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(15.0))),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: maxWidth,
                  maxHeight: maxHeight,
                ),
                padding: const EdgeInsets.fromLTRB(15, 15, 15, 30),
                color: Colors.white,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.hasCloseButton ?? false) (
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () { Navigator.pop(context); (widget.callback == null ? () {} : widget.callback!(false)); },
                            child: const Icon(Icons.close),
                          )
                        ],
                      )
                    ) else (
                      const SizedBox(height: 10,)
                    ),
                    Image.asset(imageUrl, height: imageHeight, fit: BoxFit.fitWidth),
                    const SizedBox(height: 10,),
                    ...renderText(),
                    ...renderButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}