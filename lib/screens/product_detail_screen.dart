import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geeta/models/product.dart';
import 'package:geeta/service/api_service.dart';
import 'package:geeta/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Color(0xffF1F4FB),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Stack(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.arrow_back),
                          CachedNetworkImage(
                            imageUrl: product.image,
                            height: 200,
                          ),
                          const Icon(Icons.favorite)
                        ],
                      ),
                    ],
                  ),
                ),
                const Gap(50),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        )),
                    child: Column(
                      children: [
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.title,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  "\$${product.price} USD",
                                  overflow: TextOverflow.ellipsis,
                                )
                              ],
                            ),
                          ],
                        ),
                        const Gap(30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                              ),
                              child: const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.remove),
                                  Text('1'),
                                  Icon(
                                    Icons.add,
                                  )
                                ],
                              ),
                            ),
                            const Icon(Icons.share)
                          ],
                        ),
                        const Gap(30),
                        const Text("Description"),
                        const Gap(30),
                        Text(product.description),
                        const Spacer(),
                        const Gap(10),
                        CustomButton(
                          text: "ADD TO CART",
                          onTap: () {
                            try {
                              APIService().addToCart(product);
                            } catch (e) {
                              print(e.toString());
                            }
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
