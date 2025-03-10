import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:turn_digital/core/Global/theming/color_manager.dart';

Future<void> showError(String error) async {
  await Fluttertoast.cancel();
  await Fluttertoast.showToast(
    msg: error,
    backgroundColor: AppColorsManager.warningColor,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}

Future<void> showSuccess(String message) async {
  await Fluttertoast.cancel();
  await Fluttertoast.showToast(
    backgroundColor: AppColorsManager.doneColor,
    textColor: Colors.white,
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
  );
}
