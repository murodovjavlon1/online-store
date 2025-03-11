import 'package:flutter/material.dart';
import 'package:pro/providers/cart.dart';
import 'package:pro/providers/orders.dart';
import 'package:pro/widgets/cart_list_item.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text("Sizning Savatchangiz"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            child: Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    "Umumiy : \$${cart.totalPrice}",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<Orders>(context, listen: false).addToOrder(
                          cart.cartItems.values.toList(), cart.totalPrice);
                      cart.clear();
                    },
                    child: Text("Buyutma Qilish "),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.cartItems.length,
              itemBuilder: (context, index) {
                final carttItem = cart.cartItems.values.toList()[index];
                return CartListItem(
                  productId: cart.cartItems.keys.toList()[index],
                  name: carttItem.title,
                  image: carttItem.imageUrl,
                  price: carttItem.price,
                  quantity: carttItem.quantity,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
