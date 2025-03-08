import 'package:flutter/material.dart';
import 'package:pro/providers/cart.dart';
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
    //print(producId);
    final produc = Provider.of<Products>(context, listen: false)
        .list
        .firstWhere((pro) => pro.id == producId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.greenAccent,
        title: Text(produc.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Image.network(
                produc.imagUrll,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "${produc.description}",
              ),
            ),
          ],
        ),
      ),
      bottomSheet: BottomAppBar(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    //      padding: EdgeInsets.only(top: 13),
                    child: Text(
                      "Narxi: ${produc.price}",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  final isExist = cart.cartItems.containsKey(produc.id);
                  if (isExist) {
                    return ElevatedButton.icon(
                      onPressed: () {
                        Navigator.of(context).pushNamed("/cart");
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 46, 34, 34),
                        backgroundColor:
                            const Color.fromARGB(255, 221, 212, 212),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      label: Text(
                        "Savatga O'tish ",
                        style: TextStyle(color: Colors.black54),
                      ),
                      icon: Icon(
                        Icons.shopping_bag,
                        color: Colors.black54,
                      ),
                    );
                  } else {
                    return ElevatedButton(
                      onPressed: () {
                        cart.addToCart(
                          produc.id,
                          produc.title,
                          produc.imagUrll,
                          produc.price,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color.fromARGB(255, 15, 15, 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Savatga qo'shish",
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
