import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:geeta/models/cart.dart';
import 'package:geeta/service/api_service.dart';
import 'package:geeta/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatefulWidget {
  const MyCartScreen({super.key});

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  late Future<List<Cart>> cartItems;

  @override
  void initState() {
    cartItems = APIService().getCarts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Cart"),
      ),
      floatingActionButton: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: CustomButton(text: 'GO TO CHECKOUT'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: FutureBuilder<List<Cart>>(
          future: cartItems,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print('Error: ${snapshot.error}');
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final cart = snapshot.data;
              return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.builder(
                      itemCount: cart!.length,
                      itemBuilder: (context, index) {
                        //  final c = cart[index];

                        return const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CartDesign(),
                        );
                      }));
            }
          }),
    );
  }
}

class CartDesign extends StatelessWidget {
  const CartDesign({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Container(
      padding: const EdgeInsets.all(15),
      height: 150,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xffF1F4FB),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  CachedNetworkImage(imageUrl: cart.);
            Image.asset('assets/images/dres.png'),
            const Gap(10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Printed Shirt"),
                const Text("GEETA COLLECTION"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("GEETA COLLECTION"),
                    Container(
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(Icons.remove),
                          Text(cart.products.length.toString()),
                          const Icon(
                            Icons.add,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            )
          ]),
    );
  }
}
