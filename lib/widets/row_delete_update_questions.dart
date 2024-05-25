// ignore_for_file: non_constant_identifier_names

import 'package:cashier/widets/texts/custom_text.dart';
import 'package:flutter/material.dart';

import '../../const/constants.dart';
import '../containers/empty.dart';
import '../texts/custom_text.dart';
import 'containers/empty.dart';

Widget Row_delete_Update_Questions({
  required context,
  required color,
  required String count,
  required String Question,
  required delete_onPressed,
  required Function() onTap,
}) {
  final size = MediaQuery.of(context).size;
  return Container_Empty(
    Padding: 1,
    color: color,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            padding: const EdgeInsets.only(left: 8),
            onPressed: delete_onPressed,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
              size: 28,
            )),

        // ===================================================

        InkWell(
          onTap: onTap,
          child: Container(
            alignment: Alignment.centerRight,
            width: size.width / 1.4,
            child: Custom_Text(
              text: Question,
              size: 20 / 1.09,
              fontweight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
        ),
        Custom_Text(
          text: '$count  ',
          size: 18,
          fontweight: FontWeight.w400,
          color: Colors.white,
        ),
      ],
    ),
  );
}
