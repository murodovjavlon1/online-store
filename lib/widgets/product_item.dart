import 'package:flutter/material.dart';
import 'package:pro/widgets/produut_details_screen.dart';

class ProductItem extends StatelessWidget {
  final String image;
  final String producId;
  final String title;
  const ProductItem({
    super.key,
    required this.image,
    required this.title,
    required this.producId,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        // ignore: sort_child_properties_last
        child: GestureDetector(
          onTap: () {
            Navigator.of(context)
                .pushNamed(ProduutDetailsScreen.routeName, arguments: producId);
          },
          child: Image.network(
            image,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: const Color.fromARGB(221, 27, 27, 27),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_outline,
              color: Colors.greenAccent,
            ),
          ),
          title: Text(
            title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            onPressed: () {},
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
