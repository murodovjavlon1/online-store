import 'package:pro/models/cart_Item.dart';

class Order {
  final String id;
  final double totalPric;
  final DateTime dateTime;
  final List<CartItem> products;

  Order({
    required this.id,
    required this.totalPric,
    required this.dateTime,
    required this.products,
  });
}
