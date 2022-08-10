import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../bookings/apointment_details.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('orders')
              .where(
                'status',
                isEqualTo: 'pending',
              )
              .where(
                'uid',
                isEqualTo: FirebaseAuth.instance.currentUser!.uid,
              )
              .snapshots(),
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
            if (snapshot.hasData) {
              if (snapshot.data!.docs.length == 0) {
                return Center(
                  child: Text('No Current Appointments'),
                );
              } else {
                return Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Text(
                    //     '29 Decemeber 2002',
                    //     textAlign: TextAlign.start,
                    //     style:
                    //         TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
                    //   ),
                    // ),
                    Container(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (BuildContext context, int index) {
                            Map<String, dynamic> snap =
                                snapshot.data!.docs[index].data()
                                    as Map<String, dynamic>;
                            return Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (builder) =>
                                            ApointmentDetails(snap: snap),
                                      ),
                                    );
                                  },
                                  // trailing: IconButton(
                                  //   onPressed: () async {
                                  //     await Database()
                                  //         .orderComplete(uuid: snap['uuid']);
                                  //   },
                                  //   icon: const Icon(Icons.check),
                                  // ),
                                  leading: Text(snap['date']),
                                  title: Text(
                                    'Location: ${snap['loc'].toString()}',
                                  ),
                                  subtitle: Text('Price: ${snap['price']} AED'),
                                ),
                                Divider()
                              ],
                            );
                          }),
                    ),
                  ],
                );
              }
            } else {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
          },
        ),
      ),
    );
  }
}
