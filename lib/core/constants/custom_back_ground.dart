// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

Widget Custom_Back_Ground({required Widget widget}) {
  return Stack(
    children: [
      SizedBox(
        height: 100.h,
        width: 100.w,
        child: Image.asset('assets/images/bg.jpg', fit: BoxFit.cover),
      ),
      Container(
        height: 100.h,
        width: 100.w,
        color: const Color.fromARGB(174, 0, 0, 0),
        child: widget,
      ),
    ],
  );
}
