import 'package:city_max/screens/widgets/sofa_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SofaCleaningScreen extends StatefulWidget {
  String type;
  String category;
  SofaCleaningScreen({
    Key? key,
    required this.type,
    required this.category,
  }) : super(key: key);

  @override
  State<SofaCleaningScreen> createState() => _SofaCleaningScreenState();
}

class _SofaCleaningScreenState extends State<SofaCleaningScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.type,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('Services')
              .where('servicetype', isEqualTo: widget.type)
              .where('serviceCategory', isEqualTo: widget.category)
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  return ListTileItem(
                    snap: snapshot.data!.docs[index].data(),
                  );
                });
          }),
    );
  }
}
