import 'package:city_max/pages/cleaningservices.dart';
import 'package:city_max/pages/commercialdisinfection.dart';
import 'package:city_max/pages/deepcleaning.dart';
import 'package:city_max/pages/longlasting_distinction.dart';
import 'package:city_max/pages/residentialarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CleaningStuff extends StatefulWidget {
  const CleaningStuff({Key? key}) : super(key: key);

  @override
  State<CleaningStuff> createState() => _CleaningStuffState();
}

class _CleaningStuffState extends State<CleaningStuff> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cleaning Services '),
          bottom:  TabBar(
            isScrollable: true,
              labelStyle: TextStyle(fontSize: 12.0),  //For Selected tab
            tabs: <Widget>[
              Tab(
                text: "Cleaning",
              ),
              Tab(
                text: "Long-lasting Distinction",
              ),
              Tab(
                text: "Resdential Area",
              ),
               Tab(
                text: "Commercial Disinfection",
              ),
               Tab(
                text: "Deep Cleaning",
              ),
            ],
          ),
        ),
        body:  TabBarView(
          children: <Widget>[ 
            CleaningServices(),
            LongLastingDistinction(),
            ResidentialArea(),
            CommercialDisinfection(),
            DeepCleaning()
          ],
        ),
      ),
    );
  }
}