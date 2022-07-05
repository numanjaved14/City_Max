
import 'package:flutter/material.dart';


class OnBoardingTwo extends StatelessWidget {
  const OnBoardingTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime _selectedDate = DateTime.now();
    return  Scaffold(
      backgroundColor: Colors.white,
     
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             
              SizedBox(height: 21),
           Center(
               child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child:  Image.asset('assets/deadline.png')),
             ),
               
             
           SizedBox(height: 61),
         Center(
           child: RichText(
            textAlign: TextAlign.center,
  text: TextSpan(
    text: 'Make your Appointment to get your desired service.',
    style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700,fontSize: 18),
    children: const <TextSpan>[
      TextSpan(text:' Best service provider app. The service you want is here to serve you.', 
            style: TextStyle(color: Colors.black,fontWeight: FontWeight.w600,fontSize: 18),
),
     
    ],
  
  

                 ),
               ),
         ),
            
              SizedBox(
                height: 20,
              ),
              
            
            
            ],
          ),
        ),
      ),
    );
  }
}
