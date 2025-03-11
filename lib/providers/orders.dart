import 'package:flutter/material.dart';
import 'package:pro/models/cart_Item.dart';
import 'package:pro/models/order.dart';

class Orders with ChangeNotifier {
  List<Order> _listOrders = [];

  List<Order> get items {
    return [..._listOrders];
  }

  void addToOrder(List<CartItem> products, double total) {
    _listOrders.insert(
      0,
      Order(
          id: UniqueKey().toString(),
          totalPric: total,
          dateTime: DateTime.now(),
          products: products),
    );
    notifyListeners();
  }
}
