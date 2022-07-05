import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppointPastDetail extends StatefulWidget {
  const AppointPastDetail({Key? key}) : super(key: key);

  @override
  State<AppointPastDetail> createState() => _AppointPastDetailState();
}

class _AppointPastDetailState extends State<AppointPastDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.blue
        ),
          elevation: 2,
          backgroundColor: Colors.white,
        
        centerTitle: true,
        title: Text('Past Appointment Detail',style: TextStyle(color: Colors.black),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child:  Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: Image.asset(
                  'assets/splash.png',
                  width: 200,
                )),
                SizedBox(
                  height: 20,
                ),
                 Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'User Name',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                                              fontWeight: FontWeight.w700

                      ),
                    )),
                     SizedBox(
                  height: 10,
                ),
               Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Fawad Kaleem',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        
                      ),
                    )),
                     SizedBox(
                  height: 20,
                ),
                     Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Phone Number',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                                              fontWeight: FontWeight.w700

                      ),
                    )),
                  
               Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      '+029422343',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        
                      ),
                    )),
                     SizedBox(
                  height: 20,
                ),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Select Service Type',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                                              fontWeight: FontWeight.w700

                      ),
                    )),
                     SizedBox(
                  height: 10,
                ),
               Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Carpets',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        
                      ),
                    )),
                  SizedBox(height: 20,),
                Container(
                    margin: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      'Select Area',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    )),
                      SizedBox(
                  height: 10,
                ),
              Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Residential Area',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    )),
                  SizedBox(height: 20,),
                     Container(
                    margin: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      'Address',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    )),
                       Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      '245 B Eden Garden',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    )),
                     SizedBox(height: 20,),
                     Container(
                    margin: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      'Booking Description',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    )),
                         Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Clean two rooms and all the floor carpets in given time',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    )),
                    
                      SizedBox(
                  height: 10,
                ),
                 Container(
                    margin: EdgeInsets.only(left: 20,top: 10),
                    child: Text(
                      'Time Slots',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    )),
                Container(
                   margin: EdgeInsets.only(left: 15,right: 15),
                  child: DateTimePicker(
                    type: DateTimePickerType.dateTimeSeparate,
                    dateMask: 'd MMM, yyyy',
                    initialValue: DateTime.now().toString(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    icon: Icon(Icons.event),
                    dateLabelText: 'Date',
                    timeLabelText: "Hour",
                    selectableDayPredicate: (date) {
                      // Disable weekend days to select from the calendar
                      if (date.weekday == 6 || date.weekday == 7) {
                        return false;
                      }

                      return true;
                    },
                    onChanged: (val) => print(val),
                    validator: (val) {
                      print(val);
                      return null;
                    },
                    onSaved: (val) => print(val),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Price',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    )),
                 Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      '123 \AED',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        
                      ),
                    )),
                  SizedBox(height: 20,),
                   Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Text(
                      'Rating',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700
                      ),
                    )),
               Container(
                 margin: EdgeInsets.only(left: 10),
                 child: RatingBar.builder(
   initialRating: 3,
   minRating: 1,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   itemBuilder: (context, _) => Icon(
     Icons.star,
     color: Colors.amber,
   ),
   onRatingUpdate: (rating) {
     print(rating);
   },
),
               )
              ],
            ),
          ),
      ),
    );
  }
}