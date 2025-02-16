import 'package:flutter/material.dart';
import 'package:pro/providers/products.dart';
import 'package:pro/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final productsDate = Provider.of<Products>(context);
    final producs = productsDate.list;
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
          return ProductItem(
            image: producs[index].imagUrll,
            title: producs[index].title,
            producId: producs[index].id,
          );
        });
  }
}
