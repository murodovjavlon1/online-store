import 'package:flutter/material.dart';
import 'package:pro/models/product.dart';
import 'package:pro/providers/cart.dart';
import 'package:pro/widgets/produt_details_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProduutDetailsScreen.routeName,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imagUrll,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child; // Rasm yuklanib bo‘lsa, uni ko‘rsatish
              }
              return const Center(
                child: Icon(
                  Icons.image, //  Rasm yuklanayotgan paytda ko‘rsatish
                  size: 50,
                  color: Colors.grey,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                  Icons.broken_image, //  Rasm yuklanmasa, xatolik belgisi
                  size: 50,
                  color: Colors.red,
                ),
              );
            },
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
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Mahsulot savatga qo'shildi"),
                  duration: Duration(seconds: 1),
                  behavior: SnackBarBehavior.floating,
                ),
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
