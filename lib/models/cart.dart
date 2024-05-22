import 'package:flutter/material.dart';
import 'package:shoes_commerce/models/shoe.dart';

class Cart extends ChangeNotifier {
  // list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: "Puma Freak",
        price: "223",
        imagePath: "lib/images/b_s.jpeg",
        description: "Jump "),
    Shoe(
        name: "Puma Jordans",
        price: "332",
        imagePath: "lib/images/rw_s.jpeg",
        description: "run "),
    Shoe(
        name: "Puma Road",
        price: "423",
        imagePath: "lib/images/bw_s.jpeg",
        description: "fly "),
  ];
  // list of items in users Cart
  List<Shoe> userCart = [];

  // get the list of shoes for sale
  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // get cart
  List<Shoe> getUserCart() {
    return userCart;
  }

  // add items
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // remove items
  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
