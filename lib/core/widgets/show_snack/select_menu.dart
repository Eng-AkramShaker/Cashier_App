// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../constants/constants.dart';

Snack_Select_Menu({required context, required Widget widget, required onPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: widget,
        backgroundColor: w_grey_Color,
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: redColor,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'إلغاء',
                  style: TextStyle(color: wtColor),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: greenColor,
                ),
                onPressed: onPressed,
                child: const Text(
                  'تأكيد',
                  style: TextStyle(color: wtColor),
                ),
              ),
            ],
          ),
        ],
      );
    },
  );
}
