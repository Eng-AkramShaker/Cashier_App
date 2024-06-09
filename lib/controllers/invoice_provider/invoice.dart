// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../categories_provider/categories.dart';

class Invoice_Provider with ChangeNotifier {
  //

  double Remaining_price = 0.0;
  double count = 0;
  double pay = 0;
  double discount = 0.0;

  int Number_of_invoices = 0;

  TextEditingController text_controlle = TextEditingController();

//   Add methods to manage categories  ============================================

  void addCategory(category) {
    notifyListeners();
  }

//  discount_Percentage ===========================================================

  discount_Percentage(context, num, Value) {
    final provCategory = Provider.of<Categories_Provider>(context, listen: false);

    if (provCategory.Cal_total > 0) {
      var originalPrice = double.parse(num.toString());
      double discountValue = double.parse(Value.toString());
      double discount_Percentage = (discountValue / originalPrice) * 100;
      double roundedNumber = double.parse(discount_Percentage.toStringAsFixed(2));

      provCategory.Cal_total -= roundedNumber;
      if (provCategory.Cal_total < 0) {
        provCategory.Cal_total = 0.0;
      }

      print(roundedNumber);

      notifyListeners();
    }
  }
}
