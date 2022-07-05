
import 'package:city_max/authphone/verifyphone.dart';
import 'package:city_max/main/mainscreen.dart';
import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';

class ContinuePhone extends StatelessWidget {
  const ContinuePhone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PhoneController controller;
    return Scaffold(
      backgroundColor: Colors.white,
      
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/splash.png'),
               SizedBox(
                height: 51,
              ),
              Text(
                'Add your phone number we will send you verification code as a via you are real',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 51,
              ),
              PhoneFormField(
                key: Key('phone-field'),
                shouldFormat: true, // default
                decoration: InputDecoration(
                    hintText: "Enter Phone Number",
                    border:
                        OutlineInputBorder() // default to UnderlineInputBorder(),
                    // ...
                    ),
                validator: PhoneValidator
                    .validMobile(), // default PhoneValidator.valid()
                countrySelectorNavigator:
                    CountrySelectorNavigator.bottomSheet(),
                showFlagInInput: true, // default
                flagSize: 16, // default
                autofillHints: [
                  AutofillHints.telephoneNumber
                ], // default to null
                enabled: true, // default
                autofocus: false, // default
                autovalidateMode: AutovalidateMode.onUserInteraction, // default
                onChanged: (p) => print('changed $p'),
              ),
              
              
              SizedBox(height: 40),

             
              Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => VerifyPhone()));
          }, child: Text('Send OTP'),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Color(0xff0DC6DF),
            fixedSize: Size(330, 50)
          )),
        ),
                      SizedBox(height: 20),

         InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => MainScreen()));
          },
           child: Center(
             child: RichText(
              textAlign: TextAlign.center,
  text: TextSpan(
    text: 'Or \n ',
    style: TextStyle(color: Color(0xff0DC6DF),fontWeight: FontWeight.w400,fontSize: 15),
    children: const <TextSpan>[
      TextSpan(text:' Continue Without Registration', 
              style: TextStyle(color: Color(0xff0DC6DF),fontWeight: FontWeight.w400,fontSize: 15),
),
    ],
  
  

                   ),
                 ),
           ),
         ),
              
            ],
          ),
        ),
      
    );
  }
}
