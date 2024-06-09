// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../core/constants/constants.dart';
import '../texts/custom_text.dart';

Widget Costume_card({required String img, required String title, required String price, required String stock_qty}) {
  return Stack(
    children: [
      Card(
        color: Colors.transparent,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: primaryColor,
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
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
                  height: 12.h,
                  width: 15.w,
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(height: .8.h),
              Text(
                title,
                style: GoogleFonts.robotoSlab(
                  fontSize: 11.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: .5.h),
              Text(
                'SR $price',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 11.sp,
                  color: bgColor,
                ),
              ),
              SizedBox(height: .8.h),
            ],
          ),
        ),
      ),
      // --------------------------------------------------------------------
      Positioned(
        top: 10,
        left: 10,
        child: Container(
          //
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.black,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Center(
              child: Custom_Text(
                text: stock_qty,
                size: 12.sp,
                color: wtColor,
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
