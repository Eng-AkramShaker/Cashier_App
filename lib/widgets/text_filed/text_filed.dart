// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Custom_Text_Field extends StatelessWidget {
  Custom_Text_Field({
    super.key,
    required this.hint_text,
    required this.TEXT_controller,
    required this.color,
  });

  final TextEditingController TEXT_controller;
  final String hint_text;
  Color? color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SizedBox(
      width: size.width / 6,
      height: 50,
      child: TextFormField(
        controller: TEXT_controller,
        decoration: InputDecoration(
          hintText: hint_text,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 131, 125, 125)),
          filled: true,
          contentPadding: const EdgeInsets.only(top: 3),
          fillColor: const Color.fromARGB(113, 216, 170, 70),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color.fromARGB(255, 58, 127, 255)),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),
        textAlign: TextAlign.center, // Center the hint text
        style: TextStyle(color: Colors.black, fontSize: 16.sp),
      ),
    );
  }
}
