import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../screens/sofa_cleaning.dart';

class LongLastingDistinction extends StatefulWidget {
  const LongLastingDistinction({Key? key}) : super(key: key);

  @override
  State<LongLastingDistinction> createState() => _LongLastingDistinctionState();
}

class _LongLastingDistinctionState extends State<LongLastingDistinction> {
  String title = 'Long-Lasting Disinfection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Long-Lasting Disinfection')
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
                        .where('servicetype',
                            isEqualTo: 'Long-Lasting Disinfection')
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
                                          imagePath:
                                              'assets/rasidential-apartment-disinfection.jpeg',
                                          type: title,
                                          category: 'Residential Appartments',
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
                                                      'assets/rasidential-apartment-disinfection.jpeg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Residential \n Appartments',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Residential Appartments']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Residential Appartments'] !=
                                                    0
                                                ? Text(
                                                    'Upto ${discountMap['Residential Appartments']} % discount',
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
                                              'assets/villa-disinfection.jpg',
                                          type: title,
                                          category: 'Residential Villa',
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
                                                      'assets/villa-disinfection.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Residential \n Villa',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Residential Villa']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Residential Villa'] !=
                                                    0
                                                ? Text(
                                                    'Upto ${discountMap['Residential Villa']} % discount',
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
                                              'assets/commercial-disinfection.jpg',
                                          type: title,
                                          category: 'Commercial',
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
                                                      'assets/commercial-disinfection.jpg'),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Commercial',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Service at fixed price:\n${dataMap['Commercial']} AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Commercial'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Commercial']} % discount',
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
