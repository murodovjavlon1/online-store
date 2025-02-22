import 'package:flutter/material.dart';
import 'package:pro/models/product.dart';
import 'package:pro/providers/cart.dart';
import 'package:pro/widgets/produut_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
   // print(cart.cartItems);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(ProduutDetailsScreen.routeName,
                arguments: product.id);
          },
          child: Image.network(
            product.imagUrll,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(221, 27, 27, 27),
          leading: Consumer<Product>(
            builder: (context, pro, child) {
              return IconButton(
                onPressed: () {
                  pro.toggleFavorite();
                },
                icon: Icon(
                  pro.isFavorite ? Icons.favorite : Icons.favorite_outline,
                  color: Colors.greenAccent,
                ),
              );
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {
              cart.addToCart(
                product.id,
                product.title,
                product.imagUrll,
                product.price,
              );
            },
            icon: const Icon(
              Icons.shopping_cart,
              color: Colors.greenAccent,
            ),
          ),
        ),
      ),
    );
  }
}
