import 'package:flutter/material.dart';
import 'package:pro/providers/products.dart';
import 'package:provider/provider.dart';

class ProduutDetailsScreen extends StatelessWidget {
  const ProduutDetailsScreen({
    super.key,
  });

  static const routeName = "/product-details";

  @override
  Widget build(BuildContext context) {
    final producId = ModalRoute.of(context)!.settings.arguments;
    print(producId);
    final produc = Provider.of<Products>(context, listen: false)
        .list
        .firstWhere((pro) => pro.id == producId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(produc.title),
      ),
      body: const Center(
        child: Text(""),
      ),
    );
  }
}
