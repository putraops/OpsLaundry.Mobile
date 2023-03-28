import 'package:flutter/cupertino.dart';

void clearStackAndPushRoute(BuildContext context, Widget route) {
  Navigator.popUntil(context, (_) => !Navigator.canPop(context));
  Navigator.pushReplacement(context, CupertinoPageRoute(builder: (BuildContext context) => route));
}