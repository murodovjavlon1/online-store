import 'package:flutter/material.dart';
import 'package:pro/models/product.dart';
import 'package:provider/provider.dart';

class UserProducItem extends StatelessWidget {
  const UserProducItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final produc = Provider.of<Product>(context);
    return Card(
      child: ListTile(
        title: Text(produc.title),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(produc.imagUrll),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.edit,
                color: Theme.of(context).primaryColor,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
