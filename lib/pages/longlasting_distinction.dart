import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../detail/servicedetail.dart';
import '../screens/sofa_cleaning.dart';

class LongLastingDistinction extends StatefulWidget {
  const LongLastingDistinction({Key? key}) : super(key: key);

  @override
  State<LongLastingDistinction> createState() => _LongLastingDistinctionState();
}

class _LongLastingDistinctionState extends State<LongLastingDistinction> {
  String title = 'Long-lasting Distintion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Long-lasting Distintion')
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Start Price:\n${dataMap['Residential Appartments']} AED',
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
                                                        'assets/rasidential-apartment-disinfection.jpeg',
                                                    type: title,
                                                    category:
                                                        'Residential Appartments',
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
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SofaCleaningScreen(
                                  imagePath: 'assets/villa-disinfection.jpg',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Start Price:\n${dataMap['Residential Villa']} AED',
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
                                                        'assets/villa-disinfection.jpg',
                                                    type: title,
                                                    category:
                                                        'Residential Villa',
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
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Start Price:\n${dataMap['Commercial']} AED',
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
                                                        'assets/commercial-disinfection.jpg',
                                                    type: title,
                                                    category: 'Commercial',
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
