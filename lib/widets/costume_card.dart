// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Costume_card() {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: const Color(0xFFFBC02D),
    ),
    height: 238,
    width: 300,
    child: Column(
      children: [
        SizedBox(
            height: 120,
            width: 300,
            child: Image.network(
              "https://i.imgur.com/QTP0z6u.jpg",
              fit: BoxFit.fitWidth,
            )),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Crispy Quinoa Burgers",
          style: GoogleFonts.robotoSlab(fontSize: 15, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 45),
            Column(
              children: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "100 gm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      color: Color(0xFFFBC02D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("75 LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                TextButton(
                  style: TextButton.styleFrom(backgroundColor: Colors.black),
                  onPressed: () {},
                  child: const Text(
                    "150 gm",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 8,
                      color: Color(0xFFFBC02D),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                const Text("100 LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                TextButton(
                    style: TextButton.styleFrom(backgroundColor: Colors.black),
                    onPressed: () {},
                    child: const Text(
                      "200 gm",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 8,
                        color: Color(0xFFFBC02D),
                      ),
                    )),
                const SizedBox(
                  height: 5,
                ),
                const Text("135 LE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black,
                    ))
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
