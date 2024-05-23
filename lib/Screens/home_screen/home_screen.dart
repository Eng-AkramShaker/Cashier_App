// ignore_for_file: non_constant_identifier_names, must_be_immutable, camel_case_types, unused_local_variable, unused_field, constant_identifier_names, unused_element

import 'package:flutter/material.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  int wid = 0;
  bool visable = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(height: 10),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 400, 20),
                          child: SizedBox(
                              height: 80,
                              width: 150,
                              child: Image.network(
                                "https://i.imgur.com/v3dvpCE.gif",
                                fit: BoxFit.fitWidth,
                                scale: 20,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const SizedBox(
                          width: 50,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              wid = 0;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: wid == 0 ? Colors.white : const Color(0xFFFBC02D),
                            ),
                            height: 100,
                            width: 100,
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.whatshot,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Most Orderd"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              wid = 1;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: wid == 1 ? Colors.white : const Color(0xFFFBC02D),
                            ),
                            height: 100,
                            width: 100,
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.set_meal_outlined,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Main Meals"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              wid = 2;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: wid == 2 ? Colors.white : const Color(0xFFFBC02D),
                            ),
                            height: 100,
                            width: 100,
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.fastfood_outlined,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Sandwich"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              wid = 3;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: wid == 3 ? Colors.white : const Color(0xFFFBC02D),
                            ),
                            height: 100,
                            width: 100,
                            child: const Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Icon(
                                  Icons.local_drink_outlined,
                                  size: 25,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text("Drinks"),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 300,
                ),
                Column(
                  children: [if (visable) ...{}],
                )
              ],
            ),
            const SizedBox(width: 300, height: 15),
            if (wid == 0) ...[],
          ]),
        ),
      ),
    );
  }
}
