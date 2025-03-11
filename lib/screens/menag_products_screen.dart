import 'package:flutter/material.dart';
import 'package:pro/providers/products.dart';
import 'package:pro/widgets/app_drawer.dart';
import 'package:pro/widgets/user_produc_item.dart';
import 'package:provider/provider.dart';

class MenagProductsScreen extends StatelessWidget {
  const MenagProductsScreen({super.key});

  static const routeName = "/menag_produc";

  @override
  Widget build(BuildContext context) {
    final produc = Provider.of<Products>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: const Text("Mahsulotlarni Boshqarish "),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, "/edit-prod");
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const AppDrawer(),
      body: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: produc.list.length,
          itemBuilder: (context, index) {
            final produ = produc.list[index];
            return ChangeNotifierProvider.value(
              value: produ,
              child: const UserProducItem(),
            );
          }),
    );
  }
}
