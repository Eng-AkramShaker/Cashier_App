// ignore_for_file: non_constant_identifier_names, unused_local_variable

import 'package:cashier/widgets/texts/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../cards/empty.dart';

Widget Row_Choose_Category({
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
    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
    child: Container_Empty(
      Padding: 0,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                padding: EdgeInsets.only(left: 2.w),
                onPressed: delete_onPressed,
                icon: Icon(
                  Icons.delete,
                  color: Colors.red,
                  size: 3.h,
                ),
              ),
              SizedBox(width: 3.w),
              Custom_Text(
                text: 'Price :  $price',
                size: 12.sp,
                fontweight: FontWeight.bold,
                color: Colors.black,
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(right: 1.5.w, left: 2.w),
            alignment: Alignment.centerRight,
            child: Custom_Text(
              text: count ?? '1',
              size: 12.sp,
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
                        size: 12.sp,
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
                        size: 12.sp,
                        fontweight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
          Container(
            width: 17.w,
            padding: EdgeInsets.only(right: 1.w),
            alignment: Alignment.centerRight,
            child: Custom_Text(
              text: name,
              size: 12.sp,
              fontweight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    ),
  );
}
