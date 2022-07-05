import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommercialDisinfection extends StatefulWidget {
  const CommercialDisinfection({Key? key}) : super(key: key);

  @override
  State<CommercialDisinfection> createState() => _CommercialDisinfectionState();
}

class _CommercialDisinfectionState extends State<CommercialDisinfection> {
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Upto 500 \nSQM Price:\n252 AED',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '500 to 1500 \nSQM Price:\n1252 AED',
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Over 1500 \nSQM Price:\n1252 AED',
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
          //Curtain
          
        ],
      ),
    );
  }
}