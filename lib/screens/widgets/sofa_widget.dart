import 'package:flutter/material.dart';

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
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(
          widget.snap['serviceSubCategory'].toString(),
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${widget.snap['price'].toString()} AED',
          // style: TextStyle(fontWeight: Font),
        ),
        trailing: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (builder) => ServiceDetail(
                  snap: widget.snap,
                ),
              ),
            );
          },
          child: Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.3,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue, width: 1),
                borderRadius: BorderRadius.circular(20)),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Add Service'),
                  // IconButton(
                  //     onPressed: () {
                  //       debugPrint('...Called');
                  //       if (_itemCount != 0) {
                  //         setState(() {
                  //           setState(() => _itemCount--);
                  //         });
                  //       }
                  //     },
                  //     icon: Icon(
                  //       Icons.remove,
                  //       size: 10,
                  //     )),
                  // Text(
                  //   _itemCount.toString(),
                  //   style: TextStyle(fontSize: 10),
                  // ),
                  // IconButton(
                  //     onPressed: () {
                  //       debugPrint('Called');
                  //       setState(() => _itemCount++);
                  //     },
                  //     icon: Icon(
                  //       Icons.add,
                  //       size: 10,
                  //     )),
                ],
              ),
            ),
          ),
        ),
      ),
    );

    // new ListTile(
    //   title: new Text(''),
    //   trailing: new Row(
    //     children: <Widget>[
    //       _itemCount != 0
    //           ? new IconButton(
    //               icon: new Icon(Icons.remove),
    //               onPressed: () => setState(() => _itemCount--),
    //             )
    //           : new Container(),
    //       new Text(_itemCount.toString()),
    //       new IconButton(
    //           icon: new Icon(Icons.add),
    //           onPressed: () => setState(() => _itemCount++))
    //     ],
    //   ),
    // );
  }
}
