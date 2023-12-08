class Product {
  final String title;
  final double price;
  final String image;

  Product({
    required this.title,
    required this.price,
    required this.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      price: json['price'],
      image: json['image'],
    );
  }
}
