import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../detail/servicedetail.dart';
import '../screens/sofa_cleaning.dart';

class ResidentialArea extends StatefulWidget {
  const ResidentialArea({Key? key}) : super(key: key);

  @override
  State<ResidentialArea> createState() => _ResidentialAreaState();
}

class _ResidentialAreaState extends State<ResidentialArea> {
  String title = 'Resdential Area';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Services')
              .where('servicetype', isEqualTo: 'Resdential Area')
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
                                  'assets/flat.png',
                                  height: 70,
                                  width: 70,
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Hourly Price:\n${dataMap['Appartments']} AED',
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
                                                imagePath:
                                                    'assets/Appartment.jpg',
                                                type: title,
                                                category: 'Appartments',
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
                                  'assets/villa.png',
                                  height: 70,
                                  width: 70,
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
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Hourly Price:\n${dataMap['Villas']} AED',
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
                                                imagePath: 'assets/Villa.jpg',
                                                type: title,
                                                category: 'Villas',
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
