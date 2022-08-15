import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/sofa_cleaning.dart';

class DeepCleaning extends StatefulWidget {
  const DeepCleaning({Key? key}) : super(key: key);

  @override
  State<DeepCleaning> createState() => _DeepCleaningState();
}

class _DeepCleaningState extends State<DeepCleaning> {
  String title = 'Deep Cleaning';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Deep Cleaning')
                .snapshots(),
            builder: (context,
                AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong'),
                );
              }

              if (snapshot.hasData) {
                // snapshot.data!.docs[0].data();
                Map<String, String> dataMap = new HashMap();
                for (int i = 0; i < snapshot.data!.docs.length; i++) {
                  debugPrint('...........' +
                      snapshot.data!.docs[i].data()['serviceCategory']);
                  dataMap[snapshot.data!.docs[i].data()['serviceCategory']] =
                      snapshot.data!.docs[i].data()['price'];
                }
                debugPrint(dataMap.toString());

                return StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('discount')
                        .where('servicetype', isEqualTo: 'Deep Cleaning')
                        .snapshots(),
                    builder: (context,
                        AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                            snapshot) {
                      if (snapshot.hasError) {
                        return const Center(
                          child: Text('Something went wrong'),
                        );
                      }
                      if (snapshot.hasData) {
                        Map<String, dynamic> discountMap = new HashMap();
                        for (int i = 0; i < snapshot.data!.docs.length; i++) {
                          debugPrint('...........' +
                              snapshot.data!.docs[i].data()['serviceCategory']);
                          discountMap[snapshot.data!.docs[i]
                                  .data()['serviceCategory']] =
                              snapshot.data!.docs[i].data()['discount'];
                        }
                        debugPrint(discountMap.toString());

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            SofaCleaningScreen(
                                          imagePath: 'assets/Appartment.jpg',
                                          type: title,
                                          category: 'Appartments',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 180,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 60,
                                                  backgroundImage: AssetImage(
                                                      'assets/aaa.jpeg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Appartment',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Appartments']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Appartments'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Appartments']} % discount',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            SofaCleaningScreen(
                                          imagePath: 'assets/v.jpeg',
                                          type: title,
                                          category: 'Villas',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 180,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 60,
                                                  backgroundImage: AssetImage(
                                                      'assets/v.jpeg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Villa',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Villas']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Villas'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Villas']} % discount',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            //Sofas
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            SofaCleaningScreen(
                                          imagePath:
                                              'assets/Kitchen Cleaning.jpg',
                                          type: title,
                                          category: 'Kitchen',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 180,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 60,
                                                  backgroundImage: AssetImage(
                                                      'assets/Kitchen Cleaning.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Kitchen',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Kitchen']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Kitchen'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Kitchen']} % discount',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            SofaCleaningScreen(
                                          imagePath:
                                              'assets/Bathroom Cleaning.jpg',
                                          type: title,
                                          category: 'Bathroom',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: 180,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Center(
                                              child: FittedBox(
                                                fit: BoxFit.contain,
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 60,
                                                  backgroundImage: AssetImage(
                                                      'assets/Bathroom Cleaning.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Bathroom',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Bathroom']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Bathroom'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Bathroom']} % discount',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        color: Colors.green,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            //Curtain
                          ],
                        );
                      }
                      ;

                      return Center(
                        child: CircularProgressIndicator.adaptive(),
                      );
                    });
              } else {
                return const Center(
                  child: CircularProgressIndicator.adaptive(),
                );
              }
            }),
      ),
    );
  }
}
