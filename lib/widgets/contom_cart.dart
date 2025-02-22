import 'package:flutter/material.dart';

class ContomCart extends StatelessWidget {
  final IconData icon;
  final String number;
  const ContomCart({super.key, required this.icon, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.topRight,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Icon(icon),
          ),
          Positioned(
            bottom: 14,
            child: Container(
              alignment: Alignment.center,
              width: 10,
              height: 15,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: Text(
                number,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 70, 49, 47),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
