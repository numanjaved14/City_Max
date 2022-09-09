import 'package:city_max/providers/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../detail/servicedetail.dart';

class ListTileItem extends StatefulWidget {
  var snap;
  ListTileItem({
    required this.snap,
  });
  @override
  _ListTileItemState createState() => _ListTileItemState();
}

class _ListTileItemState extends State<ListTileItem> {
  int _itemCount = 0;
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          widget.snap['serviceSubCategory'].toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: widget.snap['discount'].toString() == '' ||
                widget.snap['discount'].toString() == '0'
            ? Text(
                '${widget.snap['price'].toString()} AED',
                // style: TextStyle(fontWeight: Font),
              )
            : Text.rich(
                TextSpan(
                  text: 'Discount Price ',
                  children: <TextSpan>[
                    new TextSpan(
                      text: '${widget.snap['price'].toString()} AED',
                      style: new TextStyle(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    new TextSpan(
                      text:
                          '\n ${double.parse(widget.snap['price'].toString()) - double.parse(widget.snap['discount'].toString())} AED',
                    ),
                  ],
                ),
              ),
        trailing: Container(
          height: MediaQuery.of(context).size.height * 0.04,
          width: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue, width: 1),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('Add Service'),
                IconButton(
                  onPressed: () {
                    if (_itemCount != 0) {
                      setState(() {
                        setState(() => _itemCount--);
                      });
                    }
                  },
                  icon: Icon(
                    Icons.remove,
                    size: 10,
                  ),
                ),
                Text(
                  _itemCount.toString(),
                  style: TextStyle(fontSize: 10, color: Colors.black),
                ),
                IconButton(
                  onPressed: () {
                    setState(() => _itemCount++);
                    cart.addItem(
                      uuid: widget.snap['uuid'].toString(),
                      price: widget.snap['discount'].toString() == '' ||
                              widget.snap['discount'].toString() == '0'
                          ? double.parse(widget.snap['price'].toString())
                          : double.parse(widget.snap['price'].toString()) -
                              double.parse(widget.snap['discount'].toString()),
                      type: widget.snap['servicetype'].toString(),
                      desc: widget.snap['description'].toString(),
                      category: widget.snap['serviceCategory'].toString(),
                      subCategory: widget.snap['serviceSubCategory'].toString(),
                    );
                    debugPrint(cart.items.values.toString());
                  },
                  icon: Icon(
                    Icons.add,
                    size: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
