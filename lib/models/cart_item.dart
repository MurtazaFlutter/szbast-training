class ProductItem {
    int productId;
    int quantity;

    ProductItem({
        required this.productId,
        required this.quantity,
    });

    factory ProductItem.fromJson(Map<String, dynamic> json) => ProductItem(
        productId: json["productId"],
        quantity: json["quantity"],
    );

    Map<String, dynamic> toJson() => {
        "productId": productId,
        "quantity": quantity,
    };
}