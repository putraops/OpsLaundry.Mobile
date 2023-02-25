import 'package:flutter/material.dart';
import 'package:mobile_apps/context/GlobalContext.dart';
import 'package:mobile_apps/constants/color.dart' as color;

confirmDialog({
  required String confirmButtonText,
  required Function(bool) callback,
  TextStyle? confirmButtonTextStyle,
  // Function(void)? confirmButtonPress,
  Widget? buttonText,
  bool? hasCancelButton = false,
  String? cancelButtonText,
  TextStyle? cancelButtonTextStyle,
  // Function? cancelButtonPress,
  bool? reverse = false,
}) {
  var context = NavigationService.navigatorKey.currentContext!;

  Widget confirmButton = TextButton(
    child: Text(confirmButtonText, style: confirmButtonTextStyle ?? const TextStyle(color: color.primary),),
    onPressed: () => {
      callback(true),
      Navigator.pop(context),
    }
  );

  Widget cancelButton = buttonText == null ? TextButton(
    child: Text(cancelButtonText ?? "Cancel", style: cancelButtonTextStyle ?? const TextStyle(color: Color.fromRGBO(1, 1, 1, 0.4)),),
    onPressed:  () {
      Navigator.pop(context);
    },
  ) : GestureDetector(
    child: buttonText,
    onTap: () => {
      Navigator.pop(context),
    }
  );

  List<Widget> actionButtons = <Widget>[];
  if (reverse!) {
    if (hasCancelButton!) {
      actionButtons.add(cancelButton);
    }
    actionButtons.add(confirmButton);
  } else {
    actionButtons.add(confirmButton);
    if (hasCancelButton!) {
      actionButtons.add(cancelButton);
    }
  }


  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("Peringatan!", style: TextStyle(fontSize: 16, letterSpacing: -.25)),
    content: const Text("Apakah yakin ingin menghapus?", style: TextStyle(fontSize: 14, letterSpacing: -.25)),
    actions: actionButtons,
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}