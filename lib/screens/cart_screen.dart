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
        title: const Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: const EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Spacer(),
                  Chip(
                    label: Text(
                      'AED${cart.totalAmount.toStringAsFixed(2)}',
                      style: const TextStyle(
                          // color: Theme.of(context).primaryTextTheme.title.color,
                          ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      // Provider.of<Orders>(context, listen: false).addOrder(
                      //   cart.items.values.toList(),
                      //   cart.totalAmount,
                      // );
                      List<Map<String, dynamic>> _items = [];
                      for (int i = 0; i < cart.items.length; i++) {
                        debugPrint(i.toString());
                        _items.add({
                          'uuid': cart.items.values.toList()[i].uuid,
                          'price': cart.items.values.toList()[i].price,
                          'quantity': cart.items.values.toList()[i].quantity,
                          'serviceType': cart.items.values.toList()[i].type,
                          'serivceCategory':
                              cart.items.values.toList()[i].category,
                          'serivceSubCat':
                              cart.items.values.toList()[i].subCategory,
                        });
                      }

                      String res = await DatabaseMethods().addOrder(
                        products: _items,
                        // products: cart.items.values.toList(),
                        serviceHours: '',
                        heros: '',
                        desc: '',
                        loc: '',
                        date: '',
                        time: '',
                        price: cart.totalAmount,
                        paid: false,
                      );
                      cart.clear();
                      ScaffoldMessenger(
                        child: SnackBar(
                          content: Text(res),
                        ),
                      );
                    },
                    // textColor: Theme.of(context).primaryColor,
                    child: const Text('ORDER NOW'),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
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
