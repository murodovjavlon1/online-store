import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pro/providers/orders.dart';
import 'package:pro/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  static const routeName = "/orders";

  @override
  Widget build(BuildContext context) {
    final orders = Provider.of<Orders>(context);
    //final producs = Provider.of<Product>(context);
    // print(producs);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: const Text("Buyurtmalar"),
      ),
      drawer: const AppDrawer(),
      body: orders.items.isEmpty
          ? const Center(child: Text("Hozircha buyurtmalar yo'q"))
          : ListView.builder(
              itemCount: orders.items.length,
              itemBuilder: (context, index) {
                final order = orders.items[index];
                // final order = orders.items[index];

                return ExpansionTile(
                  title: Text("\$${order.totalPric}"),
                  subtitle: Text(
                    DateFormat("dd/MM/yyyy hh:mm").format(order.dateTime),
                  ),
                );
              },
            ),
    );
  }
}
