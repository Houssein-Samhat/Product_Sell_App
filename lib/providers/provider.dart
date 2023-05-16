import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:product_selling/models/product.dart';
import 'package:product_selling/services/load_data.dart';

class DataHolder extends ChangeNotifier {
  List<Product> products = [];
  bool loading = false;

  Future<void> fill_products() async {
    loading = true;
    products = await get_products();
    loading = false;
    notifyListeners();
  }
}
