import 'package:flutter/material.dart';
import 'package:pro/models/cart_Item.dart';

class Cart with ChangeNotifier {
  Map<String, CartItem> _Items = {};

  Map<String, CartItem> get cartItems {
    return {..._Items};
  }

  int itemsCount() {
    return _Items.length;
  }

  int itemsCont() {
    return _Items.length;
  }

  double get totalPrice {
    var total = 0.0;
    _Items.forEach((key, cartItem) {
      total += cartItem.price * cartItem.quantity;
    });
    return total;
  }

  void addToCart(
    String productId,
    String title,
    String image,
    double price,
  ) {
    if (_Items.containsKey(productId)) {
      //sonini ozgartiramiz
      _Items.update(
          productId,
          (existingCartItem) => CartItem(
                id: existingCartItem.id,
                title: existingCartItem.title,
                imageUrl: existingCartItem.imageUrl,
                price: existingCartItem.price,
                quantity: existingCartItem.quantity + 1,
              ));
    } else {
      // Yangi masulot qushyabdi savatchaga
      _Items.putIfAbsent(
          productId,
          () => CartItem(
                id: UniqueKey().toString(),
                title: title,
                imageUrl: image,
                price: price,
                quantity: 1,
              ));
    }

    notifyListeners();
  }

  void removeSingleItem(String productId) {
    if (!_Items.containsKey(productId) || _Items[productId] == null) {
      return;
    }

    if (_Items[productId]!.quantity > 1) {
      _Items.update(
        productId,
        (existingCartItem) => CartItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          imageUrl: existingCartItem.imageUrl,
          price: existingCartItem.price,
          quantity: existingCartItem.quantity - 1,
        ),
      );
      notifyListeners();
    }
  }

  void removeItem(String productId) {
    _Items.remove(productId);
    notifyListeners();
  }

  void clear() {
    _Items.clear();
    notifyListeners();
  }
}
