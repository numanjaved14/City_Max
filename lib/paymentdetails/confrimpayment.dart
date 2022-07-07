import 'package:city_max/firebasedb/firebasedb.dart';
import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/paymentdetails/add_card.dart';
import 'package:city_max/phoneAuthentication/phoneauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfrimPayment extends StatefulWidget {
  String title, subTitle, serviceHours, heros, desc, loc, date, time, price;
  ConfrimPayment({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.desc,
    required this.loc,
    required this.date,
    required this.time,
    required this.price,
  }) : super(key: key);

  @override
  State<ConfrimPayment> createState() => _ConfrimPaymentState();
}

class _ConfrimPaymentState extends State<ConfrimPayment> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Conformation'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: ListTile(
                  title: Text('Order Detail'),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Service Category'),
                            Text(widget.title),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Service Type'),
                            Text(widget.subTitle),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Price'),
                            Text('${widget.price} AED'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Address'),
                            Text(widget.loc),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Number of Heros'),
                            Text(widget.heros.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Service Hours'),
                            Text(widget.serviceHours.toString()),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Avail Offers'),
                            Text('Bi-Weekly'),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Card(
              child: ListTile(
                  title: Text('Payment Detail'),
                  subtitle: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Net Amount'),
                            Text('AED ${widget.price}'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('VAT 5%'),
                            Text('AED .5%'),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Total Amount'),
                            Text('50 AED'),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 60),
              ),
              onPressed: () async {
                setState(() {
                  _isLoading = true;
                });
                if (FirebaseAuth.instance.currentUser != null) {
                  String res = await DatabaseMethods().addOrder(
                      title: widget.title,
                      subTitle: widget.subTitle,
                      serviceHours: widget.serviceHours,
                      heros: widget.heros,
                      desc: widget.desc,
                      loc: widget.loc,
                      date: widget.date,
                      time: widget.time,
                      price: widget.price);
                  if (res == 'success') {
                    setState(() {
                      _isLoading = false;
                    });
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (builder) => MainScreen(),
                      ),
                    );
                  } else {
                    setState(() {
                      _isLoading = false;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Something went wrong!'),
                      ),
                    );
                  }
                } else {
                  setState(() {
                    _isLoading = false;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Please Register your Account.'),
                      action: SnackBarAction(
                          label: 'Register',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => const PhoneAuth(),
                              ),
                            );
                          }),
                    ),
                  );
                }
              },
              child: _isLoading
                  ? const Center(
                      child: CircularProgressIndicator.adaptive(),
                    )
                  : const Text('Confrim Appointment'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (builder) => AddCard()));
              },
              child: const Text('Click here to add payment method'),
            ),
          ),
        ],
      ),
    );
  }
}
