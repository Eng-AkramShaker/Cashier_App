// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cashier/widets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import '../containers/empty.dart';

Widget Row_Choose_Category(
    {required context, color, required String price, String? count, required String name, required delete_onPressed}) {
  //
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
    child: Container_Empty(
      Padding: 0,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  padding: const EdgeInsets.only(left: 8),
                  onPressed: delete_onPressed,
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 28,
                  )),

              //
              const SizedBox(width: 20),

              Custom_Text(text: 'Price :  $price', size: 15, fontweight: FontWeight.bold, color: Colors.black),
            ],
          ),

          // -------------------------------------------------

          Container(
            padding: const EdgeInsets.only(right: 13),
            alignment: Alignment.centerRight,
            child: Custom_Text(text: count ?? '1', size: 15, fontweight: FontWeight.bold, color: Colors.black),
          ),

          // -------------------------------------------------

          Container(
            width: 120,
            padding: const EdgeInsets.only(right: 13),
            alignment: Alignment.centerRight,
            child: Custom_Text(text: name ?? ' ', size: 15, fontweight: FontWeight.bold, color: Colors.black),
          ),
        ],
      ),
    ),
  );
}
