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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SofaCleaningScreen(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('assets/Small Space.jpg'),
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
                                          'Upto 500 to 1000 \nSQM Starts at:\n${dataMap['Small Space']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
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
                                builder: (builder) => SofaCleaningScreen(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('assets/Medium Space.jpg'),
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
                                          '500 to 1000 \nSQM Starts at:\n${dataMap['Medium Space']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
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
                                builder: (builder) => SofaCleaningScreen(
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                        child: CircleAvatar(
                                      radius: 70,
                                      backgroundImage:
                                          AssetImage('assets/Large Space.jpg'),
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
                                          'Over 1000 \nSQM Price:\n${dataMap['Large Space']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w300),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
      ),
    );
  }
}
