// ignore_for_file: avoid_print, non_constant_identifier_names, empty_catches, unnecessary_string_interpolations, camel_case_types, unused_element

import 'package:flutter/material.dart';

class Categories_Provider with ChangeNotifier {
  //

  List List_Categories = [];
  var count = 00.00;

// =============================================================================

  // Add methods to manage categories
  void addCategory(category) {
    List_Categories.add(category);
    notifyListeners();
  }

  void removeCategory(int index) {
    List_Categories.removeAt(index);
    notifyListeners();
  }
}
