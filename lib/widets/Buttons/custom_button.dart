// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Custom_Button(BuildContext? context, onPressed, {IconData? icon, String? title, double? size_text, Color_text}) {
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100.0)),
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      minimumSize: const Size(10, 10),
    ),
    onPressed: onPressed,
    child: icon != null
        ? Icon(icon, color: Colors.white, size: 35)
        : Text(
            title ?? '',
            style: TextStyle(
              color: Color_text ?? Colors.white,
              fontSize: size_text ?? 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Lemonada',
            ),
          ),
  );
}
