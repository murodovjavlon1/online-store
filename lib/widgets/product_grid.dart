// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pro/models/product.dart';
import 'package:pro/providers/products.dart';
import 'package:pro/widgets/product_item.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class ProductGrid extends StatelessWidget {
  final bool showFavorites;
  const ProductGrid({
    super.key,
    required this.showFavorites,
  });

  @override
  Widget build(BuildContext context) {
    final productsDate = Provider.of<Products>(context);
    final producs =showFavorites ? productsDate.favorites:  productsDate.list;
    return GridView.builder(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 40,
          mainAxisSpacing: 15,
        ),
        itemCount: producs.length,
        itemBuilder: (context, index) {
          return ChangeNotifierProvider<Product>.value(
            value: producs[index],
            child: const ProductItem(),
          );
        });
  }
}
