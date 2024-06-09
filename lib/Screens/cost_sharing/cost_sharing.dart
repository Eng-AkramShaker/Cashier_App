// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/categories_provider/categories.dart';
import '../../controllers/invoice_provider/invoice.dart';
import '../../core/constants/custom_back_ground.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/cards/empty.dart';
import '../../widgets/show_snack/snak_total.dart';
import '../../widgets/texts/custom_text.dart';

class Cost_Sharing extends StatefulWidget {
  const Cost_Sharing({super.key});

  @override
  State<Cost_Sharing> createState() => _Cost_SharingState();
}

class _Cost_SharingState extends State<Cost_Sharing> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
      return Scaffold(
        appBar: AppBar(backgroundColor: Color.fromARGB(255, 136, 136, 136)),
        backgroundColor: Color.fromARGB(0, 216, 216, 216),
        body: Custom_Back_Ground(
            widget: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 1.1,
                width: size.width,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: pro_Invoice.Number_of_invoices,
                    itemBuilder: (BuildContext context, int index) {
                      int num = index + 1;
                      return Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: Custom_Text(
                                text: 'Invoice no ( $num )',
                                size: 15.sp,
                                fontweight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              width: size.width / 2.9,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(111, 193, 221, 245),
                                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                                  border: Border.all(width: 4, color: Colors.white)),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                    child: Container(
                                      height: size.height / 1.7,
                                      // color: Colors.green,
                                      child: ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: provCategory.List_Categories.length,
                                          itemBuilder: (BuildContext context, int index) {
                                            final category = provCategory.List_Categories[index];

                                            return Items_Sharing(
                                              context: context,
                                              color: Color.fromARGB(226, 255, 220, 116),
                                              price: category['price'].toString(),
                                              name: category['title'].toString(),
                                              count: category['number'].toString(),
                                              details: category['details'].toString(),
                                              delete_onPressed: () {
                                                //
                                                provCategory.removeCategory(index);

                                                setState(() {
                                                  pro_Invoice.Remaining_price = 0;
                                                  pro_Invoice.pay = 0;
                                                });
                                              },
                                            );
                                          }),
                                    ),
                                  ), // --------------------------------------------------------

                                  Container(
                                    height: size.height / 5,
                                    width: size.width / 2.05,
                                    decoration: BoxDecoration(
                                      color: Color.fromARGB(255, 13, 35, 56),
                                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                                    ),
                                    child: Column(
                                      children: [
                                        SizedBox(height: 1.2.w),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(left: 1.5.w),
                                              child: Custom_Button(
                                                context: context,
                                                horizontal: 1.5.w,
                                                Border_Color: Colors.orange,
                                                Color_text: Colors.black,
                                                title: 'Total',
                                                onPressed: () {
                                                  //

                                                  Snack_Total(
                                                    context: context,
                                                    widget: Custom_Text(
                                                        text: " 77", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),
                                                    onTap: (value) {
                                                      //
                                                      var myDouble = double.parse(value);
                                                    },
                                                  );
                                                },
                                              ),
                                            ),
                                            Row(
                                              children: [
                                                Custom_Text(
                                                    text: 'Balance Due :  ',
                                                    size: 13.sp,
                                                    fontweight: FontWeight.bold,
                                                    color: Colors.white),
                                                Custom_Text(
                                                  text:
                                                      'SR  ${(provCategory.Cal_total / pro_Invoice.Number_of_invoices).toStringAsFixed(2)}',
                                                  size: 16.sp,
                                                  fontweight: FontWeight.bold,
                                                  color: const Color.fromARGB(255, 255, 179, 65),
                                                ),
                                              ],
                                            ),
                                            SizedBox(width: 5),
                                          ],
                                        ),
                                        SizedBox(height: 2.w),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Custom_Button(
                                              context: context,
                                              horizontal: 3.w,
                                              Border_Color: Colors.orange,
                                              Color_text: Colors.black,
                                              title: 'Print Check',
                                              onPressed: () {
                                                //
                                              },
                                            ),
                                            SizedBox(width: 3.w),
                                            Custom_Button(
                                              context: context,
                                              horizontal: 3.w,
                                              Border_Color: Colors.orange,
                                              Color_text: Colors.black,
                                              title: 'Pay Check',
                                              onPressed: () {
                                                //
                                              },
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ],
          ),
        )),
      );
    });
  }
}

Widget Items_Sharing({
  required context,
  color,
  required String price,
  String? count,
  required String name,
  required String details,
  required delete_onPressed,
}) {
  //
  final size = MediaQuery.of(context).size;
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
    child: Container_Empty(
      Padding: 0,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 1.3.w),
              Custom_Text(text: 'Price :  $price', size: 10.sp, fontweight: FontWeight.bold, color: Colors.black),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: .8.w, left: 1.1.w),
            alignment: Alignment.centerRight,
            child: Custom_Text(
              text: count ?? '1',
              size: 10.sp,
              fontweight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          details.isNotEmpty
              ? Container(
                  width: 10.w,
                  alignment: Alignment.centerRight,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 1.w),
                      child: Custom_Text(
                        text: details,
                        size: 10.sp,
                        fontweight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              : Container(
                  width: 10.w,
                  alignment: Alignment.centerRight,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 3.w),
                      child: Custom_Text(
                        text: 'S',
                        size: 10.sp,
                        fontweight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
          Container(
            width: 12.w,
            padding: EdgeInsets.only(right: 1.w),
            alignment: Alignment.centerRight,
            child: Custom_Text(
              text: name,
              size: 10.sp,
              fontweight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
