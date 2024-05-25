// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Costume_card({required String img, required String title, required String price}) {
  return Card(
    color: Colors.transparent,
    child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: const Color(0xFFFBC02D)),
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
              price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
          ],
        )),
  );
}
