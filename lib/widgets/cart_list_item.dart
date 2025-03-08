import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pro/providers/cart.dart';
import 'package:provider/provider.dart';

class CartListItem extends StatelessWidget {
  final String image;
  final String productId;
  final String name;
  final double price;
  final int quantity;
  const CartListItem({
    super.key,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
    required this.productId,
  });

  void _notifyUserAboutDelete(BuildContext context, Function() delete) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Diqqat"),
        content: const Text("Savatchadan o'chirmoqchimis;"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(ctx).pop();
            },
            child: const Text("Bekor qilish "),
          ),
          ElevatedButton(
              onPressed: () {
                delete();
                Navigator.of(ctx).pop();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.error,
              ),
              child: const Text(
                "O'chirish",
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context, listen: false);
    return Slidable(
      key: ValueKey(productId),
      endActionPane: ActionPane(
        extentRatio: 0.3,
        motion: const ScrollMotion(),
        children: [
          Container(
            alignment: Alignment.center,
            height: 50,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () {
                _notifyUserAboutDelete(
                    context, () => cart.removeItem(productId));
                // cart.removeItem(productId);
              },
              child: const Text(
                "O'chirish",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(image),
          ),
          title: Text("$name"),
          subtitle: Text("${quantity * price} \$"),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              IconButton(
                onPressed: () {
                  cart.removeSingleItem(productId);
                },
                icon: const Icon(Icons.remove),
              ),
              Text("${quantity.toString()}"),
              IconButton(
                onPressed: () {
                  cart.addToCart(
                    productId,
                    name,
                    image,
                    price,
                  );
                },
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
