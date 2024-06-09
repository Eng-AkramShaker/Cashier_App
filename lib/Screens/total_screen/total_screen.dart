// ignore_for_file: camel_case_types, prefer_const_literals_to_create_immutables, prefer_const_constructors, unused_local_variable, non_constant_identifier_names, sized_box_for_whitespace, avoid_print, avoid_unnecessary_containers, unused_element, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/categories_provider/categories.dart';
import '../../controllers/invoice_provider/invoice.dart';
import '../../core/constants/navigators.dart';
import '../../widgets/Buttons/custom_button.dart';
import '../../widgets/cards/empty.dart';
import '../../widgets/rows/row_choose_category.dart';
import '../../widgets/show_snack/Snack_Bar.dart';
import '../../widgets/show_snack/select_menu.dart';
import '../../widgets/show_snack/snak_total.dart';
import '../../widgets/text_filed/text_filed.dart';
import '../../widgets/texts/custom_text.dart';
import '../cost_sharing/cost_sharing.dart';

class Total_Screen extends StatefulWidget {
  const Total_Screen({super.key});

  @override
  State<Total_Screen> createState() => _Total_ScreenState();
}

class _Total_ScreenState extends State<Total_Screen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Consumer2<Categories_Provider, Invoice_Provider>(builder: (context, provCategory, pro_Invoice, child) {
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
              ],
            ),
          ),

          // =============================================================================================

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.only(right: 1.5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Custom_Text(
                        text: 'Discounts :    %  ${pro_Invoice.discount}',
                        size: 11.sp,
                        fontweight: FontWeight.bold,
                        color: Colors.amber),
                    Custom_Text(text: 'Sub Total :     SR  0.0', size: 11.sp, fontweight: FontWeight.bold, color: Colors.amber),
                    // Custom_Text(text: 'Surcharge :   SR  250.00', size: 11.sp, fontweight: FontWeight.bold, color: Colors.amber),
                    Custom_Text(text: 'Tax :                SR  0.0', size: 11.sp, fontweight: FontWeight.bold, color: Colors.amber),
                  ],
                ),
              ),

              // ----------------------------------------------------------------------------------------

              SizedBox(height: 10),
              Container_Empty(
                h: 20.h,
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
                          title: 'Reset',
                          onPressed: () {
                            //

                            reset_Invoice(provCategory, pro_Invoice);
                          },
                        ),
                        // Custom_Button(
                        //   context: context,
                        //   // icon: Icons.abc,
                        //   title: 'Hold',
                        //   onPressed: () {
                        //     //
                        //   },
                        // ),
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
                          // width: 350,
                          child: Column(
                            children: [
                              Custom_Text(
                                text: 'Total : SR ${provCategory.Cal_total.toStringAsFixed(2)}',
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
                                text: 'Remaining price : SR ${pro_Invoice.Remaining_price}',
                                size: 16,
                                fontweight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    // ----------------------------------------------------------------

                    Padding(
                      padding: EdgeInsets.only(bottom: .8.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.qr_code,
                                horizontal: 1.5.w,
                                vertical: 1.4.h,
                                // circular: 100,
                                size_icon: 13.sp,
                                onPressed: () {
                                  //
                                },
                              ),
                              SizedBox(height: 1.1.h),
                              Custom_Text(text: 'Quantity', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.add,
                                horizontal: 1.5.w,
                                vertical: 1.4.h,
                                // circular: 100,
                                size_icon: 13.sp,

                                onPressed: () {
                                  //
                                },
                              ),
                              SizedBox(height: 1.1.h),
                              Custom_Text(text: 'Add', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.share,
                                horizontal: 1.5.w,
                                vertical: 1.4.h,
                                // circular: 100,
                                size_icon: 13.sp,
                                onPressed: () async {
                                  //

                                  Payment_On_Equal(context, pro_Invoice, provCategory);
                                },
                              ),
                              SizedBox(height: 1.1.h),
                              Custom_Text(text: 'Cost Sharing', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),
                          Column(
                            children: [
                              Custom_Button(
                                context: context,
                                icon: Icons.percent,
                                horizontal: 1.5.w,
                                vertical: 1.4.h,
                                // circular: 100,
                                size_icon: 13.sp,
                                onPressed: () {
                                  //
                                  Snack_Total(
                                    context: context,
                                    widget: Custom_Text(
                                        text: "   %   كم نسبة الخصم ", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),
                                    onTap: (value) {
                                      //
                                      // var myDouble = double.parse(value);

                                      pro_Invoice.discount_Percentage(context, provCategory.Cal_total, value);
                                    },
                                  );
                                },
                              ),
                              SizedBox(height: 1.1.h),
                              Custom_Text(text: 'Discuont', size: 13, fontweight: FontWeight.bold, color: Colors.black),
                            ],
                          ),

                          // pay ------------------------------------------------------------

                          Padding(
                            padding: EdgeInsets.only(bottom: 1.1.h),
                            child: Custom_Button(
                              context: context,
                              // title: 'SR ${pro_Invoice.pay}',
                              title: 'Pay',
                              size_text: 13.sp,
                              vertical: 1.8.h,
                              horizontal: 3.w,
                              backgroundColor: Colors.blue,
                              Color_text: Colors.white,
                              onPressed: () {
                                //

                                // Snack_Total(
                                //   context: context,
                                //   widget: Custom_Text(
                                //       text: " ( SR  ${provCategory.Cal_total} ) : المبلغ المراد سدادة هو ",
                                //       size: 15.sp,
                                //       fontweight: FontWeight.bold,
                                //       color: Colors.black),
                                //   onTap: (v) {
                                //     //

                                //     double myDouble = double.parse(v);

                                //     setState(() {
                                //       pro_Invoice.Remaining_price = 0.0;

                                //       if (myDouble > provCategory.Cal_total && provCategory.Cal_total != 0) {
                                //         pro_Invoice.Remaining_price = pro_Invoice.pay - provCategory.Cal_total;
                                //       } else {
                                //         provCategory.Cal_total -= myDouble;
                                //       }

                                //       print(provCategory.Cal_total);
                                //     });
                                //   },
                                // );

                                Snak_Bar(context, 'جاري طباعة الفاتورة');
                              },
                            ),
                          ),

                          // -----------------------------------
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      );
    });
  }

  Payment_On_Equal(BuildContext context, Invoice_Provider pro_Invoice, Categories_Provider provCategory) {
    Snack_Select_Menu(
      context: context,
      delete_onPressed: () {
        setState(() {
          pro_Invoice.text_controlle.text = '';
        });
        pop(context);
      },
      widget: Container(
        height: 20.h,
        child: Column(
          children: [
            Custom_Text(text: "كم من الأشخاص سوف يدفع المبلغ المستحق؟", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),
            //
            SizedBox(height: 3.h),
            Custom_Text_Field(hint_text: '0', TEXT_controller: pro_Invoice.text_controlle, color: Colors.black),
          ],
        ),
      ),
      onPressed: () {
        int? val = int.tryParse(pro_Invoice.text_controlle.text);
        setState(() {
          pro_Invoice.Number_of_invoices = val!;
        });

        if (val! > 0 && provCategory.List_Categories.isNotEmpty) {
          pop(context);
          pushNewScreen(context, Cost_Sharing());
          setState(() {
            pro_Invoice.text_controlle.text = '';
          });
        } else {
          setState(() {
            pro_Invoice.text_controlle.text = '';
          });
          pop(context);
        }
      },
    );
  }

// =====================================

  Payment_On_Demand(BuildContext context, Invoice_Provider pro_Invoice, Categories_Provider provCategory) {
    Snack_Select_Menu(
      context: context,
      delete_onPressed: () {
        setState(() {
          pro_Invoice.text_controlle.text = '';
        });
        pop(context);
      },
      widget: Container(
        height: 20.h,
        child: Column(
          children: [
            Custom_Text(text: "كم من الأشخاص سوف يدفع المبلغ المستحق؟", size: 15.sp, fontweight: FontWeight.bold, color: Colors.black),
            //
            SizedBox(height: 3.h),
            Custom_Text_Field(hint_text: '0', TEXT_controller: pro_Invoice.text_controlle, color: Colors.black),
          ],
        ),
      ),
      onPressed: () {
        int? val = int.tryParse(pro_Invoice.text_controlle.text);
        setState(() {
          pro_Invoice.Number_of_invoices = val!;
        });

        if (val! > 0 && provCategory.List_Categories.isNotEmpty) {
          pop(context);
          pushNewScreen(context, Cost_Sharing());
          setState(() {
            pro_Invoice.text_controlle.text = '';
          });
        } else {
          setState(() {
            pro_Invoice.text_controlle.text = '';
          });
          pop(context);
        }
      },
    );
  }

  // ==========================

  reset_Invoice(Categories_Provider provCategory, Invoice_Provider pro_Invoice) {
    setState(() {
      pro_Invoice.Remaining_price = 0.0;
      pro_Invoice.pay = 0;
      provCategory.Cal_total = 0.0;
      provCategory.List_Categories = [];
    });
  }
}
