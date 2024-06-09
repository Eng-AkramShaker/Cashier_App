// ignore_for_file: must_be_immutable, camel_case_types, sized_box_for_whitespace, unused_local_variable, avoid_print

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../controllers/categories_provider/categories.dart';
import '../../../core/constants/constants.dart';
import '../../../widgets/Buttons/text_button.dart';
import '../../../widgets/texts/custom_text.dart';

class widget_Menu extends StatefulWidget {
  late String img;
  late double price;
  widget_Menu({super.key, required this.img, required this.price});

  @override
  State<widget_Menu> createState() => _Custom_widgetState();
}

class _Custom_widgetState extends State<widget_Menu> {
  @override
  void initState() {
    super.initState();
    intS();
  }

  intS() {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);

    setState(() {
      // provCategory.Menu_total = widget.price;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<Categories_Provider>(builder: (context, provider, _) {
      return SizedBox(
        height: 350,
        width: 450,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:

                      // img != 'null' || img != null
                      //     ? Image.network(
                      //         img,
                      //         height: 12.h,
                      //         width: 15.w,
                      //         fit: BoxFit.fill,
                      //       )
                      // :
                      Image.asset(
                    'assets/images/empty.jpg',
                    height: 150,
                    width: size.width,
                    fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(height: 20),
                // L M S -------------------------------------
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text_Button(
                          context: context,
                          text: 'L',
                          size_text: 20,
                          backgroundColor: provider.T_F_list[0] != '' ? secondaryColor : Colors.teal,
                          onPressed: () {
                            setState(() {
                              if (provider.T_F_list[0] == '') {
                                provider.T_F_list[0] = 'L';

                                provider.Menu_total += 300;
                              } else if (provider.T_F_list[0] == 'L') {
                                provider.T_F_list[0] = '';
                                provider.Menu_total -= 300;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Custom_Text(text: 'SR 300', size: 15, color: brown_Color),
                      ],
                    ),
                    Column(
                      children: [
                        Text_Button(
                          context: context,
                          text: 'M',
                          size_text: 20,
                          backgroundColor: provider.T_F_list[1] != '' ? secondaryColor : Colors.teal,
                          onPressed: () {
                            setState(() {
                              if (provider.T_F_list[1] == '') {
                                provider.T_F_list[1] = 'M';
                                provider.Menu_total += 200;
                              } else if (provider.T_F_list[1] == 'M') {
                                provider.T_F_list[1] = '';
                                provider.Menu_total -= 200;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Custom_Text(text: 'SR 200', size: 15, color: brown_Color),
                      ],
                    ),
                    Column(
                      children: [
                        Text_Button(
                          context: context,
                          text: 'S',
                          size_text: 20,
                          backgroundColor: provider.T_F_list[2] != '' ? secondaryColor : Colors.teal,
                          onPressed: () {
                            setState(() {
                              if (provider.T_F_list[2] == '') {
                                provider.T_F_list[2] = 'S';
                                provider.Menu_total += 100;
                              } else if (provider.T_F_list[2] == 'S') {
                                provider.T_F_list[2] = '';
                                provider.Menu_total -= 100;
                              }
                            });
                          },
                        ),
                        const SizedBox(height: 10),
                        Custom_Text(text: 'SR ${widget.price}', size: 15, color: brown_Color),
                      ],
                    ),
                  ],
                ),
                const Divider(),

                // count --------------------------------------------------------------------------------

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text_Button(
                      context: context,
                      text: '-',
                      size_text: 20,
                      backgroundColor: Colors.teal,
                      onPressed: () {
                        setState(() {
                          //
                          if (provider.number != 1) {
                            provider.number -= 1;
                          }
                        });
                      },
                    ),
                    Custom_Text(text: '${provider.number}', size: 23),
                    Text_Button(
                      context: context,
                      text: '+',
                      size_text: 20,
                      backgroundColor: teal_Color,
                      onPressed: () {
                        setState(() {
                          //

                          provider.number += 1;
                        });
                      },
                    ),
                  ],
                ),
                const Divider(),
                // ==========================================
              ],
            ),
          ],
        ),
      );
    });
  }
}
