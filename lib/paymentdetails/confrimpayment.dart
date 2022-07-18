import 'dart:convert';

import 'package:city_max/firebasedb/firebasedb.dart';
import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/phoneAuthentication/phoneauth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart' as stripe;
import 'package:http/http.dart' as http;

class ConfrimPayment extends StatefulWidget {
  var snap;
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
    this.snap,
  }) : super(key: key);

  @override
  State<ConfrimPayment> createState() => _ConfrimPaymentState();
}

class _ConfrimPaymentState extends State<ConfrimPayment> {
  bool _isLoading = false;
  bool _paid = false;
  Map<String, dynamic>? paymentIntentData;

  @override
  void initState() {
    debugPrint(widget.snap.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Conformation'),
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
                if (_paid) {
                  setState(() {
                    _isLoading = true;
                  });
                  if (FirebaseAuth.instance.currentUser != null) {
                    String res = await DatabaseMethods().addOrder(
                      type: widget.title,
                      category: widget.subTitle,
                      subCatgory: widget.snap['serviceSubCategory'] == null
                          ? ''
                          : widget.snap['serviceSubCategory'],
                      serviceHours: widget.serviceHours,
                      heros: widget.heros,
                      desc: widget.desc,
                      loc: widget.loc,
                      date: widget.date,
                      time: widget.time,
                      price: widget.price,
                    );
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
                          // content: Text('Something went wrong!'),
                          content: Text(res),
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
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      // content: Text('Something went wrong!'),
                      content: Text('Please Pay Before placing order.'),
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
                makePayment();
              },
              child: const Text('Click here to add payment method'),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntentData = await createPaymentIntent(
          widget.price, 'AED'); //json.decode(response.body);
      // print('Response body==>${response.body.toString()}');
      await stripe.Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: stripe.SetupPaymentSheetParameters(
                  paymentIntentClientSecret:
                      paymentIntentData!['client_secret'],
                  applePay: true,
                  googlePay: true,
                  testEnv: true,
                  style: ThemeMode.dark,
                  merchantCountryCode: 'US',
                  merchantDisplayName: 'ANNIE'))
          .then((value) {});

      ///now finally display payment sheeet

      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
    }
  }

  displayPaymentSheet() async {
    try {
      await stripe.Stripe.instance
          .presentPaymentSheet(
              parameters: stripe.PresentPaymentSheetParameters(
        clientSecret: paymentIntentData!['client_secret'],
        confirmPayment: true,
      ))
          .then((newValue) {
        print('payment intent' + paymentIntentData!['id'].toString());
        print(
            'payment intent' + paymentIntentData!['client_secret'].toString());
        print('payment intent' + paymentIntentData!['amount'].toString());
        print('payment intent' + paymentIntentData.toString());
        _paid = true;
        //orderPlaceApi(paymentIntentData!['id'].toString());
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("paid successfully")));

        paymentIntentData = null;
      }).onError((error, stackTrace) {
        print('Exception/DISPLAYPAYMENTSHEET==> $error $stackTrace');
      });
    } on stripe.StripeException catch (e) {
      print('Exception/DISPLAYPAYMENTSHEET==> $e');
      showDialog(
          context: context,
          builder: (_) => AlertDialog(
                content: Text("Cancelled "),
              ));
    } catch (e) {
      print('$e');
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(widget.price),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      print(body);
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer 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',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      print('Create Intent reponse ===> ${response.body.toString()}');
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}
