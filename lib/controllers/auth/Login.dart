// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element, avoid_types_as_parameter_names

import 'package:flutter/material.dart';

class Login_Provider with ChangeNotifier {
  //

  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();

//  Login  ============================================

  discount_Percentage(context, num, Value) {
    print('roundedNumber');

    notifyListeners();
  }
}
