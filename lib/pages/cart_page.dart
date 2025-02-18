import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_commerce/components/cart_item.dart';
import 'package:shoes_commerce/models/cart.dart';
import 'package:shoes_commerce/models/shoe.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, cart, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // heading
              const Text(
                'My Cart',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: ListView.builder(
                  itemCount: cart.getUserCart().length,
                  itemBuilder: (context, index) {
                    // get individual shoe
                    Shoe individualShoe = cart.getUserCart()[index];

                    // return the cart item
                    return CartItem(
                      shoe: individualShoe,
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
