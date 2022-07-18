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
      body: StreamBuilder(
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
              snapshot.data!.docs[0].data();
              Map<String, String> dataMap = new HashMap();
              for (int i = 0; i < snapshot.data!.docs.length; i++) {
                debugPrint('...........' +
                    snapshot.data!.docs[i].data()['serviceCategory']);
                dataMap[snapshot.data!.docs[i].data()['serviceCategory']] =
                    snapshot.data!.docs[i].data()['price'];
              }
              debugPrint(dataMap.toString());

              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 180,
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Image.asset(
                                  'assets/planet.png',
                                  height: 70,
                                  width: 70,
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Upto 500 \nSQM Price:\n${dataMap['Small Space']} AED',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (builder) =>
                                                  SofaCleaningScreen(
                                                type: title,
                                                category: 'Small Space',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blue,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: 180,
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Image.asset(
                                  'assets/medium.png',
                                  height: 70,
                                  width: 70,
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '500 to 1500 \nSQM Price:\n${dataMap['Medium Space']} AED',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (builder) =>
                                                  SofaCleaningScreen(
                                                type: title,
                                                category: 'Medium Space',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blue,
                                        ))
                                  ],
                                )
                              ],
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
                      Container(
                        width: 180,
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                    child: Image.asset(
                                  'assets/scale.png',
                                  height: 70,
                                  width: 70,
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Over 1500 \nSQM Price:\n${dataMap['Large Space']} AED',
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (builder) =>
                                                  SofaCleaningScreen(
                                                type: title,
                                                category: 'Large Space',
                                              ),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.blue,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  //Curtain
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          }),
    );
  }
}
