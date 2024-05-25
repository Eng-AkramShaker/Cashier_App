// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';

import '../../widets/Buttons/custom_button.dart';

class Total_Screen extends StatefulWidget {
  const Total_Screen({super.key});

  @override
  State<Total_Screen> createState() => _Total_ScreenState();
}

class _Total_ScreenState extends State<Total_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            SizedBox(height: 50),
          ],
        ),
        Column(
          children: [
            Row(
              children: [
                Custom_Button(context, () {}, icon: Icons.abc, title: 'title'),
              ],
            ),
          ],
        )
      ],
    );
  }
}
