import 'package:flutter/material.dart';
import 'package:pro/widgets/product_grid.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text("Mening Do'konim"),
      ),
      body: const ProductGrid(),
    );
  }
}
