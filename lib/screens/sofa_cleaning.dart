import 'package:city_max/screens/cart_screen.dart';
import 'package:city_max/screens/widgets/badge.dart';
import 'package:city_max/screens/widgets/sofa_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class SofaCleaningScreen extends StatefulWidget {
  String imagePath;
  String type;
  String category;
  SofaCleaningScreen({
    Key? key,
    required this.type,
    required this.category,
    required this.imagePath,
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
        actions: [
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch!,
              value: cart.itemCount.toString(),
            ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_cart,
              ),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CartScreen(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
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
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    widget.imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: snapshot.data!.docs.length > 0
                //       ? Text(
                //           '${snapshot.data!.docs[0].data()['servicetype']}',
                //           style: TextStyle(
                //             color: Colors.black,
                //             fontSize: 14,
                //           ),
                //         )
                //       : Text(''),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: snapshot.data!.docs.length > 0
                      ? Text(
                          '${snapshot.data!.docs[0].data()['description']}',
                          style: TextStyle(color: Colors.black),
                        )
                      : Text(''),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      return ListTileItem(
                        snap: snapshot.data!.docs[index].data(),
                      );
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ),
                  ),
                  child: const Text('Proceed'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
