import 'package:flutter/material.dart';
import 'package:pro/screens/cart_screen.dart';

class ContomCart extends StatelessWidget {
  final IconData icon;

  const ContomCart({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(CartScreen.routeName);
          },
          icon: Icon(icon),
        ),
      ],
    );
  }
}
