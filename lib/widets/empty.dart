// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

Widget Container_Empty({double? h, double? w, required Widget child, color, required double Padding}) {
  return Container(
    height: h,
    width: w,
    padding: EdgeInsets.all(Padding),
    decoration: BoxDecoration(
      color: color ?? const Color.fromARGB(255, 226, 226, 226),
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
    ),
    child: Center(
      child: child,
    ),
  );
}
