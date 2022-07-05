import 'package:city_max/bookings/apointments/pastappointment.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PastApointment extends StatefulWidget {
  const PastApointment({Key? key}) : super(key: key);

  @override
  State<PastApointment> createState() => _PastApointmentState();
}

class _PastApointmentState extends State<PastApointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Column(
          children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('29 Decemeber 2002',textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),),
                              ),

            Container(
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                       
                        ListTile(
                           onTap: (){
                                                                                      Navigator.push(context, MaterialPageRoute(builder: (builder) => AppointPastDetail())); 

                           },
                            leading: const Text('12/21/2022'),
                            
                            trailing:   Text('Complete',style: TextStyle(color: Colors.green),),
                             
                            
                            title: Text("Fawad Kaleem"),
                            subtitle: Text("234 B Eid Gah Road Lahore"),),
                            Divider()
                      ],
                    );
                        
                  }),
            ),
          ],
        ),),
    );
  }
}