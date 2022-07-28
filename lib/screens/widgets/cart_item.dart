import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String uuid;
  final double price;
  final int quantity;
  final String title;

  CartItem({
    required this.id,
    required this.uuid,
    required this.price,
    required this.quantity,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      child: Column(children: [
        Container(
          child: Card(
            margin: EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 4,
            ),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: ListTile(
                leading: CircleAvatar(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: FittedBox(
                      child: Text('\$$price'),
                    ),
                  ),
                ),
                title: Text(title),
                subtitle: Text('Total: \$${(price * quantity)}'),
                trailing: TextButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false)
                          .removeItem(uuid: uuid);
                    },
                    child: Text('Delete')),
                // trailing: Text('$quantity x'),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
