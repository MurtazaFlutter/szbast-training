import 'package:flutter/material.dart';
import 'package:geeta/models/product.dart';
import 'package:geeta/shopping/services/api.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  late Future<List<Product>> products;

  @override
  void initState() {
    products = ProductAPI().getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder(
          future: products,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Failed to Load Data"),
              );
            } else {
              final data = snapshot.data;

              return GridView.builder(
                  itemCount: data!.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.5,
                  ),
                  itemBuilder: (context, int index) {
                    final product = data[index];

                    return Column(
                      children: [
                        Container(
                          height: 200,
                          width: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Image.network(product.image),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          product.title,
                          maxLines: 1,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text("\$${product.price}")
                      ],
                    );
                  });
            }
          }),
    );
  }
}
