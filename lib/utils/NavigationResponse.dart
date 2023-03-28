import 'package:flutter/material.dart';
import 'package:mobile_apps/navigation/AnimateNavigation.dart';

class NavigationResponse {
  static NavigationResponse? _instance;
  factory NavigationResponse() => _instance ??= NavigationResponse._();
  NavigationResponse._();

  Future<void> navigateResponse(BuildContext context, Widget widget, Function() callback) async {
    var result = await Navigator.push(context, AnimateNavigation(widget));
    callback();
  }
}