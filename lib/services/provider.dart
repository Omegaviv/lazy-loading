import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:read_excel/models/product.dart';
import 'package:http/http.dart' as http;

class Products with ChangeNotifier {
  List<Product> _products = [];

  int _start = 1;

  List<Product> get products {
    return [..._products];
  }

  Future<void> getProducts() async {
    try {
      var url = Uri.parse('http://10.0.2.2:5000/$_start'); //10.0.2.2:8000
      final response = await http.get(url);
      final data = json.decode(response.body) as List;

      print(data);
      List<Product> _loadedProducts = [];
      if (data != null) {
        data.forEach((product) {
          _loadedProducts.add(Product(
              productName: product['productName'],
              productDes: product['productDescription'],
              productRating: product['productRating'],
              productUrl: product['productUrl']));
        });
        _products.addAll(_loadedProducts);
        _start+=10;
        notifyListeners();

      }
    } catch (error) {
      throw error;
    }
  }
}
