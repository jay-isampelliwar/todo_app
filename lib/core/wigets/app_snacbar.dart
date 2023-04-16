import 'package:flutter/material.dart';

SnackBar appSnackBar(
    {required Size size, required String message, required Color color}) {
  return SnackBar(
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    duration: const Duration(
      seconds: 3,
    ),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    margin: EdgeInsets.only(
      left: size.width * 0.08,
      right: size.width * 0.08,
      bottom: size.height * 0.04,
    ),
    content: Text(message),
  );
}
