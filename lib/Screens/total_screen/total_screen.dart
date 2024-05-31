// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/categories_provider/categories.dart';
import '../../widets/Buttons/custom_button.dart';
import '../../widets/empty.dart';
import '../../widets/rows/row_choose_category.dart';
import '../../widets/show_snack/total.dart';
import '../../widets/texts/custom_text.dart';

class Total_Screen extends StatefulWidget {
  const Total_Screen({super.key});

  @override
  State<Total_Screen> createState() => _Total_ScreenState();
}

class _Total_ScreenState extends State<Total_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer<Categories_Provider>(builder: (context, provCategory, child) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                SizedBox(
                  height: size.height / 1.65,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: provCategory.List_Categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        final category = provCategory.List_Categories[index];

                        return Row_Choose_Category(
                          context: context,
                          color: Color.fromARGB(226, 255, 220, 116),
                          price: category['price'].toString(),
                          name: category['title'].toString(),
                          delete_onPressed: () {
                            //
                            provCategory.removeCategory(index);
                            setState(() {
                              provCategory.count -= category['price'];
                            });
                          },
                        );
                      }),
                ),
              ],
            ),
          ),

          // =============================================================================================

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(text: 'Discounts :    SR  10.00', size: 15, fontweight: FontWeight.bold, color: Colors.amber),
                    Custom_Text(text: 'Sub Total :     SR  250.00', size: 15, fontweight: FontWeight.bold, color: Colors.amber),
                    Custom_Text(text: 'Surcharge :   SR  250.00', size: 15, fontweight: FontWeight.bold, color: Colors.amber),
                    Custom_Text(text: 'Tax :               SR  250.00', size: 15, fontweight: FontWeight.bold, color: Colors.amber),
                  ],
                ),
              ),

              // ----------------------------------------------------------------------------------

              SizedBox(height: 10),
              Container_Empty(
                  h: 150,
                  Padding: 10,
                  color: Colors.grey[500],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Custom_Button(
                            context: context,
                            // icon: Icons.abc,
                            title: 'Cancel',
                            onPressed: () {
                              //
                            },
                          ),
                          Custom_Button(
                            context: context,
                            // icon: Icons.abc,
                            title: 'Hold',
                            onPressed: () {
                              //
                            },
                          ),
                          Custom_Button(
                            context: context,
                            // icon: Icons.abc,
                            title: 'Send',
                            onPressed: () {
                              //
                            },
                          ),

                          // ------------------------------------------------------------

                          Container(
                            width: 230,
                            child: Column(
                              children: [
                                Custom_Text(
                                  text: 'Total : SR ${provCategory.count}',
                                  size: 20,
                                  fontweight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                                Container(
                                  height: 2,
                                  margin: EdgeInsets.symmetric(vertical: 5),
                                  width: size.width / 6,
                                  color: Colors.white,
                                ),
                                SizedBox(height: 5),
                                Custom_Text(
                                  text: 'Remaining Amount : SR 150',
                                  size: 17,
                                  fontweight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // ----------------------------------------------------------------

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.qr_code,
                                horizontal: 10,
                                vertical: 10,
                                circular: 100,
                                size_icon: 20,
                                onPressed: () {
                                  //
                                },
                              ),
                              Custom_Text(text: 'Quantity', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.share,
                                horizontal: 10,
                                vertical: 10,
                                circular: 100,
                                size_icon: 20,
                                onPressed: () {
                                  //
                                },
                              ),
                              Custom_Text(text: 'Link Card', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                horizontal: 12,
                                vertical: 5,
                                circular: 100,
                                title: '+',
                                size_text: 25,
                                onPressed: () {
                                  //
                                },
                              ),
                              Custom_Text(text: 'Add', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                horizontal: 10,
                                vertical: 5,
                                circular: 100,
                                title: '%',
                                size_text: 25,
                                onPressed: () {
                                  //
                                },
                              ),
                              Custom_Text(text: 'Discuont', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),

                          // ------------------------------------------------------------

                          Custom_Button(
                            context: context,
                            title: 'SR ${provCategory.count}',
                            size_text: 25,
                            vertical: 15,
                            backgroundColor: Colors.blue,
                            Color_text: Colors.white,
                            onPressed: () {
                              //

                              Snack_Total(
                                context: context,
                                widget: Custom_Text(
                                    text: " ( SR ${provCategory.count} ) : المبلغ المراد سدادة هو ",
                                    size: 20,
                                    fontweight: FontWeight.bold,
                                    color: Colors.black),
                                onTap: (v) {
                                  //

                                  var myDouble = double.parse(v);

                                  setState(() {
                                    provCategory.count -= myDouble;
                                  });
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  )),
            ],
          ),
        ],
      );
    });
  }
}
