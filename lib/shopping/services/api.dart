import 'dart:convert';
import 'package:geeta/models/product.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  final String url = "https://fakestoreapi.com/products";

  Future<List<Product>> getProduct() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);

      List<Product> products =
          data.map((product) => Product.fromJson(product)).toList();

      return products;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
