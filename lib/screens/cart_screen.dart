import 'package:city_max/firebasedb/firebasedb.dart';
import 'package:city_max/screens/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart' show Cart;

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      'AED${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          // color: Theme.of(context).primaryTextTheme.title.color,
                          ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text('ORDER NOW'),
                    onPressed: () async {
                      // Provider.of<Orders>(context, listen: false).addOrder(
                      //   cart.items.values.toList(),
                      //   cart.totalAmount,
                      // );
                      String res = await DatabaseMethods().addOrder(
                        products: cart.items.values.toList(),
                        serviceHours: '',
                        heros: '',
                        desc: '',
                        loc: '',
                        date: '',
                        time: '',
                        price: cart.totalAmount,
                        paid: false,
                      );
                      // cart.clear();
                      ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(res),
                        ),
                      );
                    },
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                uuid: cart.items.values.toList()[i].uuid,
                id: cart.items.keys.toList()[i],
                price: cart.items.values.toList()[i].price,
                quantity: cart.items.values.toList()[i].quantity,
                title: cart.items.values.toList()[i].category,
              ),
            ),
          )
        ],
      ),
    );
  }
}
