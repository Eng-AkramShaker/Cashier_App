// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

// ================================================================================

Snack_Select_Menu({required context, required Widget widget, required onPressed}) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: widget,
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
        actions: [
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'إلغاء',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            style: TextButton.styleFrom(
              backgroundColor: Colors.green,
            ),
            onPressed: onPressed,
            child: const Text(
              'تأكيد',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      );
    },
  );
}
