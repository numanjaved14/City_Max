import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/sofa_cleaning.dart';

class ResidentialArea extends StatefulWidget {
  const ResidentialArea({Key? key}) : super(key: key);

  @override
  State<ResidentialArea> createState() => _ResidentialAreaState();
}

class _ResidentialAreaState extends State<ResidentialArea> {
  String title = 'Residential Area';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Residential Area')
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
                        .where('servicetype', isEqualTo: 'Residential Area')
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
                                                child: CircleAvatar(
                                              radius: 70,
                                              backgroundImage: AssetImage(
                                                  'assets/Appartment.jpg'),
                                            )),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Appartment',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Service at fixed price\n${dataMap['Appartments']} AED',
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
                                          imagePath: 'assets/Villa.jpg',
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
                                                child: CircleAvatar(
                                              radius: 70,
                                              backgroundImage: AssetImage(
                                                  'assets/Villa.jpg'),
                                            )),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Villa',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Service at fixed Price:\n${dataMap['Villas']} AED',
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
                          ],
                        );
                      }
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
