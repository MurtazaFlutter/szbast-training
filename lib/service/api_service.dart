import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:geeta/models/cart.dart';
import 'package:geeta/models/product.dart';
import 'package:http/http.dart' as http;

class APIService {
  static const apiURL = "https://fakestoreapi.com/products";

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(apiURL));
    debugPrint("api response ${response.body}");

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to get procuts");
    }
  }

  Future<List<Cart>> getCarts() async {
    final response = await http.get(Uri.parse('http://fakestoreapi.com/carts'));
    debugPrint("api body ${response.body}");
    if (response.statusCode == 200) {
      debugPrint("api body ${response.body}");
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Cart.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load items");
    }
  }

  Future<void> addToCart(Product product) async {
    final response = await http.post(Uri.parse('http://fakestoreapi.com/carts'),
        body: {'productId': product.id, 'quantity': 1});
    debugPrint("object ${response.body}");
    if (response.statusCode == 200) {
      debugPrint("object ${response.body}");
    }
  }
}
