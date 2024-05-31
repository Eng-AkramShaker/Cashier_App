// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/constants.dart';
import '../texts/custom_text.dart';

Widget Costume_card({required String img, required String title, required String price}) {
  return Stack(
    children: [
      Card(
        color: Colors.transparent,
        child: Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: primaryColor),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                  child: Image.network(img, height: 100, width: 200, fit: BoxFit.cover),
                ),
                const SizedBox(height: 8),
                Text(
                  title,
                  style: GoogleFonts.robotoSlab(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  'SR  $price',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: bgColor,
                  ),
                ),
                const SizedBox(height: 8),
              ],
            )),
      ),

      // --------------------------------------------------------------------

      Container(
        height: 25,
        width: 50,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: wtColor),
        child: Center(
          child: Custom_Text(text: '42 ', size: 15, color: bgColor),
        ),
      ),
    ],
  );
}
