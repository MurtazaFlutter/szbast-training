import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geeta/models/product.dart';
import 'package:geeta/screens/product_detail_screen.dart';
import 'package:geeta/service/api_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Product>> products;
  @override
  void initState() {
    products = APIService().getProduct();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Geeta.",
                        style: GoogleFonts.lato(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.search),
                  const Icon(Icons.favorite),
                  const Icon(Icons.notifications),
                  const Icon(Icons.notifications),
                ],
              ),
              const Gap(30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "FILTER & SORT",
                        style: GoogleFonts.lato(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(10),
                      const Icon(Icons.filter),
                    ],
                  ),
                  const Icon(Icons.category),
                ],
              ),
              const Gap(30),
              FutureBuilder(
                  future: products,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    } else {
                      List<Product> products = snapshot.data!;
                      return Expanded(
                        child: GridView.builder(
                            itemCount: products.length,
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisSpacing: 0,
                                    mainAxisSpacing: 0,
                                    childAspectRatio: 0.6,
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              final prod = products[index];
                              return ChangeNotifierProvider.value(
                                value: prod,
                                child: ProductDesign(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangeNotifierProvider.value(
                                                  value: prod,
                                                  child:
                                                      const ProductDetailScreen(),
                                                )));
                                  },
                                ),
                              );
                            }),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDesign extends StatelessWidget {
  final VoidCallback onTap;
  const ProductDesign({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 200,
            width: 170,
            decoration: BoxDecoration(
                color: const Color(0xffF1F4FB),
                borderRadius: BorderRadius.circular(30)),
            child: CachedNetworkImage(imageUrl: product.image),
          ),
          const Gap(20),
          Text(
            product.title,
            overflow: TextOverflow.ellipsis,
          ),
          Text(product.price.toString()),
        ],
      ),
    );
  }
}
