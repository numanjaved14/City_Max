import 'package:city_max/bookings/apointments/currentappontmentdetails.dart';
import 'package:city_max/firebasedb/firebasedb.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CurrentAppointments extends StatefulWidget {
  const CurrentAppointments({Key? key}) : super(key: key);

  @override
  State<CurrentAppointments> createState() => _CurrentAppointmentsState();
}

class _CurrentAppointmentsState extends State<CurrentAppointments> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FirebaseAuth.instance.currentUser != null
            ? StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('orders')
                    .where(
                      'status',
                      isEqualTo: 'pending',
                    )
                    .where('uid',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .snapshots(),
                builder: (context,
                    AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return const Center(
                      child: Text('Something went wrong'),
                    );
                  }
                  if (snapshot.hasData) {
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
                                        // Navigator.push(
                                        //   context,
                                        //   MaterialPageRoute(
                                        //     builder: (builder) =>
                                        //         AppointCurrentDetail(),
                                        //   ),
                                        // );
                                      },
                                      leading: Text(snap['date']),
                                      trailing: TextButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Dialog(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20.0)), //this right here
                                                  child: Container(
                                                    height: 200,
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              12.0),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          // TextField(
                                                          //   decoration: InputDecoration(
                                                          //       border:
                                                          //           InputBorder
                                                          //               .none,
                                                          //       hintText:
                                                          //           ''),
                                                          // ),
                                                          Text('Are you sure?'),
                                                          SizedBox(
                                                            width: 320.0,
                                                            child: RaisedButton(
                                                              onPressed:
                                                                  () async {
                                                                await DatabaseMethods()
                                                                    .deleteOrder(
                                                                        orderId:
                                                                            snap['uuid'])
                                                                    .then(
                                                                      (value) =>
                                                                          Navigator.pop(
                                                                              context),
                                                                    );
                                                              },
                                                              child: Text(
                                                                "Yes",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                );
                                              });
                                        },
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(color: Colors.red),
                                        ),
                                      ),
                                      title: Text(
                                        'Order id: ${snap['uuid'].toString().substring(0, 7)}',
                                      ),
                                      subtitle:
                                          Text('Price: ${snap['price']} AED'),
                                    ),
                                    Divider()
                                  ],
                                );
                              }),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  }
                })
            : const Center(
                child: Text('Please Register First'),
              ),
      ),
    );
  }
}
