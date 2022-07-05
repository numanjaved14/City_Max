import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class LongLastingDistinction extends StatefulWidget {
  const LongLastingDistinction({Key? key}) : super(key: key);

  @override
  State<LongLastingDistinction> createState() => _LongLastingDistinctionState();
}

class _LongLastingDistinctionState extends State<LongLastingDistinction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
                          'assets/building.png',
                          height: 70,
                          width: 70,
                        )),
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                          'Residential \n Appartments',
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Price:\n252 AED',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
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
                          'Residential \n Villa',
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Price:\n602 AED',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
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
                          'assets/commercial.png',
                          height: 70,
                          width: 70,
                        )),
                        SizedBox(height: 10),
                        Center(
                            child: Text(
                          'Commercial',
                          textAlign: TextAlign.center,
                        )),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Start Price:\n602 AED',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                                onPressed: () {},
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
            ],
          ),
          //Curtain
          
        ],
      ),
    );
  }
}