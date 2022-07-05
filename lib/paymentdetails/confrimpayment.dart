import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/paymentdetails/add_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ConfrimPayment extends StatefulWidget {
  const ConfrimPayment({Key? key}) : super(key: key);

  @override
  State<ConfrimPayment> createState() => _ConfrimPaymentState();
}

class _ConfrimPaymentState extends State<ConfrimPayment> {
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
              subtitle:  Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Service Category'),
                       Text('Cleaning'),

                    ],),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Service Type'),
                       Text('Sofa Cleaning'),

                  ],),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Price'),
                       Text('124 AED'),

                  ],),
                   ),
                    Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Address'),
                       Text('230 B Eden Garden'),

                  ],),
                  
                   ),
                     Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Number of Heros'),
                       Text('23'),

                  ],),
                  
                   ),
                     Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Service Hours'),
                       Text('5'),

                  ],),

                  
                  
                   ),
                     Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Avail Offers'),
                       Text('Bi-Weekly'),

                  ],),
                  
                   ),
                ],
              )
              ),
            
          ),
        ),

  Padding(
          padding: const EdgeInsets.all(5.0),
          child: Card(
            child: ListTile(
              title: Text('Payment Detail'),
              subtitle:  Column(
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Net Amount'),
                       Text('AED 70'),

                    ],),
                  ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('VAT 5%'),
                       Text('AED .5%'),

                  ],),
                   ),
                   Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text('Total Amount'),
                       Text('50 AED'),

                  ],),
                   ),
                   
                ],
              )
              ),
            
          ),
        ),
        
         Padding(
         padding: const EdgeInsets.all(8.0),
         child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                fixedSize: Size(300, 60),
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()));
              },
              child: const Text('Confrim Appointment'),
            ),
       ),
        Padding(
         padding: const EdgeInsets.all(1.0),
         child: TextButton(
              
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (builder) => AddCard()));
              },
              child: const Text('Click here to add payment method'),
            ),
       ),
        ],
      ),
    );
  }
}