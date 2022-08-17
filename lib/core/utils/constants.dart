import 'package:clean_architcture_islam/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Constants {
  static void showErrorDialog(
      {required BuildContext context, required String msg}) {
    showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: Text(msg),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('OK'))
              ],
            ));
  }

  static void showToast(
      {required String msg, Color? color, ToastGravity? toastGravity}) {
    Fluttertoast.showToast(
        msg: msg,
        gravity: toastGravity ?? ToastGravity.BOTTOM,
        backgroundColor: color ?? AppColors.primaryColor,
        toastLength: Toast.LENGTH_LONG);
  }
}
