import 'dart:collection';

import 'package:city_max/detail/servicedetail.dart';
import 'package:city_max/screens/sofa_cleaning.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CleaningServices extends StatefulWidget {
  const CleaningServices({Key? key}) : super(key: key);

  @override
  State<CleaningServices> createState() => _CleaningServicesState();
}

class _CleaningServicesState extends State<CleaningServices> {
  String title = 'Cleaning';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection('Services')
                .where('servicetype', isEqualTo: 'Cleaning')
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => ServiceDetail(
                                  title: title,
                                  subTitle: 'HouseKeeping with Materials',
                                  price:
                                      dataMap['HouseKeeping with Materials']!,
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
                                              'assets/Housekeeping-without-materials.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'House Keeping \n with Materials',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Hourly Price:\n${dataMap['HouseKeeping with Materials'].toString()} AED',
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
                                                      ServiceDetail(
                                                    title: title,
                                                    subTitle:
                                                        'HouseKeeping with Materials',
                                                    price: dataMap[
                                                        'HouseKeeping with Materials']!,
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
                                builder: (builder) => ServiceDetail(
                                  title: title,
                                  subTitle: 'HouseKeeping without Materials',
                                  price: dataMap[
                                      'HouseKeeping without Materials']!,
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
                                              'assets/housekeeping-with-materials.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'House Keeping \n without Materials',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Hourly Price:\n${dataMap['HouseKeeping without Materials'].toString()} AED',
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
                                                    ServiceDetail(
                                                  title: title,
                                                  subTitle:
                                                      'HouseKeeping without Materials',
                                                  price: dataMap[
                                                      'HouseKeeping without Materials']!,
                                                ),
                                              ),
                                            );
                                          },
                                          icon: Icon(
                                            Icons.arrow_forward,
                                            color: Colors.blue,
                                          ),
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
                                  imagePath: 'assets/Sofas Cleaning.jpg',
                                  type: title,
                                  category: 'Sofas',
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
                                          radius: 60,
                                          backgroundImage: AssetImage(
                                              'assets/Sofas Cleaning.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'Sofas',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fixed Price:\n${dataMap['Sofas'].toString()} AED',
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
                                                        'assets/Sofas Cleaning.jpg',
                                                    type: title,
                                                    category: 'Sofas',
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
                                  imagePath: 'assets/Carpets Cleaning.jpg',
                                  type: title,
                                  category: 'Carpets',
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
                                              'assets/Carpets Cleaning.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'Carpets',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fixed Price:\n${dataMap['Carpets'].toString()} AED per Hour',
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
                                                        'assets/Carpets Cleaning.jpg',
                                                    type: title,
                                                    category: 'Carpets',
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => SofaCleaningScreen(
                                  imagePath: 'assets/Curtain Cleaning.jpg',
                                  type: title,
                                  category: 'Curtains Shampooing',
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
                                              'assets/Curtain Cleaning.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'Curtains Shampooing',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fixed Price:\n${dataMap['Curtains Shampooing'].toString()} AED',
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
                                                        'assets/Curtain Cleaning.jpg',
                                                    type: title,
                                                    category:
                                                        'Curtains Shampooing',
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
                                  imagePath: 'assets/Mattress Cleaning.jpg',
                                  type: title,
                                  category: 'Mattress Shampooing',
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
                                              'assets/Mattress Cleaning.jpg'),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Center(
                                        child: Text(
                                      'Mattress Shampooing',
                                      textAlign: TextAlign.center,
                                    )),
                                    SizedBox(height: 10),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Fixed Price:\n${dataMap['Mattress Shampooing'].toString()}AED',
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
                                                        'assets/Mattress Cleaning.jpg',
                                                    type: title,
                                                    category:
                                                        'Mattress Shampooing',
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
