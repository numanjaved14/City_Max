import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../detail/servicedetail.dart';
import '../screens/sofa_cleaning.dart';

class CommercialDisinfection extends StatefulWidget {
  const CommercialDisinfection({Key? key}) : super(key: key);

  @override
  State<CommercialDisinfection> createState() => _CommercialDisinfectionState();
}

class _CommercialDisinfectionState extends State<CommercialDisinfection> {
  String title = 'Commercial Disinfection';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Commercial Disinfection')
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
                            isEqualTo: 'Commercial Disinfection')
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
                                          imagePath: 'assets/Small Space.jpg',
                                          type: title,
                                          category: 'Small Space',
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
                                                  'assets/Small Space.jpg'),
                                            )),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Small Space',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Small Space Upto 500 \nSQM ${dataMap['Small Space']} at AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Small Space'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Small Space']} % discount',
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
                                          imagePath: 'assets/Medium Space.jpg',
                                          type: title,
                                          category: 'Medium Space',
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
                                                  'assets/Medium Space.jpg'),
                                            )),
                                            SizedBox(height: 10),
                                            Center(
                                                child: Text(
                                              'Medium Space',
                                              textAlign: TextAlign.center,
                                            )),
                                            SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Medium Space 500 to \n1000 SQM ${dataMap['Medium Space']} at AED',
                                                  textAlign: TextAlign.start,
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                            discountMap['Medium Space'] != 0
                                                ? Text(
                                                    'Upto ${discountMap['Medium Space']} % discount',
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
                            Container(
                              margin: EdgeInsets.only(left: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (builder) =>
                                              SofaCleaningScreen(
                                            imagePath: 'assets/Large Space.jpg',
                                            type: title,
                                            category: 'Large Space',
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
                                                    'assets/Large Space.jpg'),
                                              )),
                                              SizedBox(height: 10),
                                              Center(
                                                  child: Text(
                                                'Large Space',
                                                textAlign: TextAlign.center,
                                              )),
                                              SizedBox(height: 10),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Large Space 1000 to 1500 \nSQM  ${dataMap['Large Space']} at AED',
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                              discountMap['Large Space'] != 0
                                                  ? Text(
                                                      'Upto ${discountMap['Large Space']} % discount',
                                                      textAlign:
                                                          TextAlign.start,
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
