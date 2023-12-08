// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';
import 'package:geeta/models/cart_item.dart';

List<Cart> cartFromJson(String str) =>
    List<Cart>.from(json.decode(str).map((x) => Cart.fromJson(x)));

String cartToJson(List<Cart> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Cart {
  int id;
  int userId;
  DateTime date;
  List<ProductItem> products;
  int v;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
    required this.v,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        id: json["id"],
        userId: json["userId"],
        date: DateTime.parse(json["date"]),
        products: List<ProductItem>.from(
            json["products"].map((x) => ProductItem.fromJson(x))),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "userId": userId,
        "date": date.toIso8601String(),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "__v": v,
      };
}
