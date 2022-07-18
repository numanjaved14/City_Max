import 'package:city_max/pages/cleaningservices.dart';
import 'package:city_max/pages/commercialdisinfection.dart';
import 'package:city_max/pages/deepcleaning.dart';
import 'package:city_max/pages/longlasting_distinction.dart';
import 'package:city_max/pages/residentialarea.dart';
import 'package:flutter/material.dart';

class CleaningStuff extends StatefulWidget {
  const CleaningStuff({Key? key}) : super(key: key);

  @override
  State<CleaningStuff> createState() => _CleaningStuffState();
}

class _CleaningStuffState extends State<CleaningStuff> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cleaning Services '),
          bottom: TabBar(
            isScrollable: true,
            labelStyle: TextStyle(fontSize: 12.0), //For Selected tab
            tabs: <Widget>[
              Tab(
                text: "Cleaning",
              ),
              Tab(
                text: "Deep Cleaning",
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
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            CleaningServices(),
            DeepCleaning(),
            LongLastingDistinction(),
            ResidentialArea(),
            CommercialDisinfection(),
          ],
        ),
      ),
    );
  }
}
