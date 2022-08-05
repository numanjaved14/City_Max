import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../detail/servicedetail.dart';
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 60,
                                          backgroundImage:
                                              AssetImage('assets/aaa.jpeg'),
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Service at fixed price:\n${dataMap['Appartments']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.white,
                                          radius: 60,
                                          backgroundImage:
                                              AssetImage('assets/v.jpetg'),
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
                                              fontWeight: FontWeight.bold),
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
                                  imagePath: 'assets/Kitchen Cleaning.jpg',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Service at fixed price:\n${dataMap['Kitchen']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
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
                                  imagePath: 'assets/Bathroom Cleaning.jpg',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Service at fixed price:\n${dataMap['Bathroom']} AED',
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    )
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
