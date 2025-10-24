import 'dart:convert';
import 'package:flutter/services.dart';

import '../models/product.dart';

class ProductRepository {
  final String assetPath;

  ProductRepository({this.assetPath = 'assets/products.json'});

  Future<List<Product>> loadProducts() async {
    final jsonStr = await rootBundle.loadString(assetPath);
    final data = json.decode(jsonStr) as List<dynamic>;
    return data.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
  }
}
