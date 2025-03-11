import 'package:flutter/material.dart';
import 'package:pro/providers/cart.dart';
import 'package:pro/widgets/app_drawer.dart';
import 'package:pro/widgets/contom_cart.dart';
import 'package:pro/widgets/product_grid.dart';
import 'package:provider/provider.dart';

enum FilterOption {
  Favorites,
  All,
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showOnlyFavorites = false; // **State ichida e’lon qilindi**

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text("Mening Do'konim"),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOption filter) {
              setState(() {
                // _showOnlyFavorites = filter == FilterOption.Favorites;
                if (filter == FilterOption.All) {
                  _showOnlyFavorites = false;
                } else {
                  _showOnlyFavorites = true;
                }
              });
            },
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                  value: FilterOption.All,
                  child: Text("Barchasi"),
                ),
                const PopupMenuItem(
                  value: FilterOption.Favorites,
                  child: Text("Sevimli"),
                ),
              ];
            },
          ),
          Consumer<Cart>(
            builder: (context, value, child) {
              return const ContomCart(
                icon: (Icons.shopping_cart),
              );
            },
          )
        ],
      ),
      drawer: const AppDrawer(),
      body: ProductGrid(showFavorites: _showOnlyFavorites),
    );
  }
}
