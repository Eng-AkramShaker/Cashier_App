// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element

import 'package:flutter/material.dart';

class Categories_Provider with ChangeNotifier {
  //

  List model_group = [];
  List model_items = [];
  int selectedCategory = 0;

// --------------------------------------

  List List_Categories = [];
  List Category = [];
  int number = 1;
  String details = '';
  List T_F_list = ['', '', ''];
  int Menu_total = 0;

  double Cal_total = 0.0;

// =============================================================================

  // Add methods to manage categories
  void addCategory(category) {
    List_Categories.add(category);
    notifyListeners();
  }

  void removeCategory(int index) {
    List_Categories.removeAt(index);
    cal_Total();
    notifyListeners();
  }

  // =============================================================================

  cal_Total() {
    Cal_total = 0;
    for (var i = 0; i < List_Categories.length; i++) {
      Cal_total += double.parse(List_Categories[i]['price'].toString());
    }

    notifyListeners();
  }
}
