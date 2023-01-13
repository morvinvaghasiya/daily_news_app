import 'package:flutter/material.dart';

class CustomMethod {
  void showSnackBar({required BuildContext context, required String content}) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(content),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating));
  }
}
