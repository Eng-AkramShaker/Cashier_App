// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Custom_Button({
  required BuildContext context,
  required onPressed,
  double? horizontal,
  double? vertical,
  double? circular,
  IconData? icon,
  String? title,
  double? size_text,
  double? size_icon,
  backgroundColor,
  Color_text,
}) {
  return ElevatedButton(
    style: TextButton.styleFrom(
      backgroundColor: backgroundColor ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(circular ?? 8),
        side: const BorderSide(color: Colors.black, width: 2.8),
      ),
      padding: EdgeInsets.symmetric(horizontal: horizontal ?? 15.0, vertical: vertical ?? 8),
      minimumSize: const Size(20, 20),
    ),
    onPressed: onPressed,
    child: icon != null
        ? Icon(icon, color: Colors.amber[900], size: size_icon ?? 35)
        : Text(
            title ?? '',
            style: TextStyle(
              color: Color_text ?? Colors.amber[900],
              fontSize: size_text ?? 18,
              fontWeight: FontWeight.normal,
              fontFamily: 'Lemonada',
            ),
          ),
  );
}
