import 'package:city_max/detail/nextdetailpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

import '../services/geo_locator.dart';

class ServiceDetail extends StatefulWidget {
  var snap;
  String? title, subTitle, price;
  ServiceDetail({
    Key? key,
    this.title,
    this.subTitle,
    this.price,
    this.snap,
  }) : super(key: key);

  @override
  State<ServiceDetail> createState() => _ServiceDetailState();
}

class _ServiceDetailState extends State<ServiceDetail> {
  int _heroCount = 2;
  int _hourCounter = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Service Details'),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Services')
              .where('serviceCategory', isEqualTo: widget.subTitle)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          widget.title == null
                              ? widget.snap['servicetype']
                              : widget.title.toString(),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.subTitle == null
                                  ? widget.snap['serviceCategory']
                                  : widget.subTitle.toString(),
                            ),
                            snapshot.data!.docs[0]
                                            .data()['discount']
                                            .toString() ==
                                        '' ||
                                    snapshot.data!.docs[0]
                                            .data()['discount']
                                            .toString() ==
                                        '0'
                                ? Text(
                                    '${snapshot.data!.docs[0].data()['price'].toString()} AED',
                                    // style: TextStyle(fontWeight: Font),
                                  )
                                : Text.rich(
                                    TextSpan(
                                      text: 'Discount Price ',
                                      children: <TextSpan>[
                                        new TextSpan(
                                          text:
                                              '${snapshot.data!.docs[0].data()['price'].toString()} AED',
                                          style: new TextStyle(
                                            color: Colors.grey,
                                            decoration:
                                                TextDecoration.lineThrough,
                                          ),
                                        ),
                                        new TextSpan(
                                          text:
                                              '\n${double.parse(snapshot.data!.docs[0].data()['price'].toString()) - double.parse(snapshot.data!.docs[0].data()['discount'].toString())} AED',
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        title: Text('How many hours of service you need'),
                        // subtitle: TextField(
                        //   controller: _hoursController,
                        //   decoration: InputDecoration(
                        //     border: InputBorder.none,
                        //     hintText: 'Service Hours',
                        //   ),
                        // ),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text('Add Service'),
                                  IconButton(
                                      onPressed: () {
                                        if (_hourCounter > 2) {
                                          setState(() {
                                            setState(() => _hourCounter--);
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        // size: 10,
                                      )),
                                  Text(
                                    _hourCounter.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        setState(() => _hourCounter++);
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        // size: 10,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Card(
                      child: ListTile(
                        title: Text('How many heros you need'),
                        subtitle: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 35.0, vertical: 10.0),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.04,
                            width: MediaQuery.of(context).size.width * 0.3,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 1),
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Text('Add Service'),
                                  IconButton(
                                      onPressed: () {
                                        if (_heroCount != 0) {
                                          setState(() {
                                            setState(() => _heroCount--);
                                          });
                                        }
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        // size: 10,
                                      )),
                                  Text(
                                    _heroCount.toString(),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      setState(() => _heroCount++);
                                    },
                                    icon: Icon(
                                      Icons.add,
                                      // size: 10,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Padding(
                  //   padding: const EdgeInsets.all(5.0),
                  //   child: Card(
                  //     child: ListTile(
                  //       title: Text('Offers'),
                  //       subtitle: Text(),
                  //       // subtitle: Row(
                  //       //   children: <Widget>[
                  //       //     Expanded(
                  //       //       child: Column(
                  //       //         children: <Widget>[
                  //       //           CustomCheckBoxGroup<String>(
                  //       //             // scrollController: ScrollController()
                  //       //             unSelectedColor: Theme.of(context).canvasColor,
                  //       //             buttonLables: [
                  //       //               "Weekly 15% Off ",
                  //       //               "Bi-Weekly 5% Off",
                  //       //               "One Time",
                  //       //             ],
                  //       //             buttonValuesList: [
                  //       //               "Weekly 15% OfF ",
                  //       //               "Bi-Weekly",
                  //       //               "One Time",
                  //       //             ],
                  //       //             checkBoxButtonValues: (values) {
                  //       //               print(values);
                  //       //             },
                  //       //             defaultSelected: ["Weekly"],
                  //       //             horizontal: true,
                  //       //             width: 120,
                  //       //             // hight: 50,
                  //       //             selectedColor:
                  //       //                 Theme.of(context).colorScheme.secondary,
                  //       //             padding: 5,
                  //       //             spacing: 0.0,

                  //       //             // enableShape: true,
                  //       //           ),
                  //       //         ],
                  //       //       ),
                  //       //     ),
                  //       //   ],
                  //       // ),
                  //       trailing: Icon(Icons.info),
                  //     ),
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(200, 60), shape: StadiumBorder()),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => NextDetailPage(
                              heros: _heroCount.toString(),
                              serviceHours: _hourCounter.toString(),
                              subTitle: widget.subTitle == null
                                  ? widget.snap['serviceCategory']
                                  : widget.subTitle!,
                              title: widget.title == null
                                  ? widget.snap['servicetype']
                                  : widget.title!,
                              price: snapshot.data!.docs[0]
                                              .data()['discount']
                                              .toString() ==
                                          '' ||
                                      snapshot.data!.docs[0]
                                              .data()['discount']
                                              .toString() ==
                                          '0'
                                  ? (double.parse(snapshot.data!.docs[0].data()['price'].toString()) *
                                          _heroCount *
                                          _hourCounter)
                                      .toString()
                                  : ((double.parse(snapshot.data!.docs[0]
                                                  .data()['price']
                                                  .toString()) *
                                              _heroCount *
                                              _hourCounter) -
                                          double.parse(snapshot.data!.docs[0]
                                              .data()['discount']
                                              .toString()))
                                      .toString(),
                              // price: widget.price == null
                              //     ? widget.snap['price']
                              //     : widget.price!,
                              snap: widget.snap,
                            ),
                          ),
                        );
                      },
                      child: const Text('Next'),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
