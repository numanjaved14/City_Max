import 'dart:math';

import 'package:city_max/main/mainscreen.dart';
import 'package:city_max/profile/profiledetail.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';


class Ot extends StatefulWidget {
  
  final String phone;
  final String codeDigits;
  Ot({required this.phone, required this.codeDigits});

  @override
  State<Ot> createState() => _OtState();
}

class _OtState extends State<Ot> {
  
  final GlobalKey<ScaffoldState> _scalfoldkey = GlobalKey<ScaffoldState>();
  final TextEditingController controllerpin = TextEditingController();
  final FocusNode pinOTPFocusNode = FocusNode();

  String? verificationCode;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    verificationPhone();
  }


  @override
  Widget build(BuildContext context) {
      final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
        borderRadius: BorderRadius.circular(20),
      ),
    );

   

   
        final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
      borderRadius: BorderRadius.circular(8),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
                        Image.asset(
                        'assets/splash.png',
                        height: 100,
                        width: 200,
                      ),
                      SizedBox(height: 30,),
                       Container(
              child: InkWell(
                child:
                    Text("verification: ${widget.codeDigits}-${widget.phone}"),
              ),
            ),
                                          SizedBox(height: 30,),

            Container(
              margin: EdgeInsets.only(left: 20,right: 20,bottom: 20,top: 20),
              child: Pinput(
                length: 6,
              
                focusNode: pinOTPFocusNode,
                controller: controllerpin,
                defaultPinTheme: defaultPinTheme,
      focusedPinTheme: focusedPinTheme,
                onSubmitted: (pin) async{
                 try{
                   await FirebaseAuth.instance.signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationCode!, smsCode: pin)).then((value) {
                     if(value.user != null){
                       Navigator.of(context).push(MaterialPageRoute(builder: (builder) => MainScreen()));
                     }
                   });
                 }catch(e){
                   FocusScope.of(context).unfocus();
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text("Invalide Code"),duration: Duration(seconds: 12),)
                   );
                 }
                },
              ),
            ),
            
            Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    'Please enter the 6-digit code \n  sent to your number',
                    style: TextStyle(color: Colors.black),textAlign: TextAlign.center,),),
                    SizedBox(height: 30,),
           
          ],
        ),
      ),
    );
  }

  void verificationPhone() async{
   await FirebaseAuth.instance.verifyPhoneNumber(phoneNumber: "${widget.codeDigits + widget.phone}", verificationCompleted: (PhoneAuthCredential credential)async{
     await FirebaseAuth.instance.signInWithCredential(credential).then((value)  {
        if(value.user != null){
        
                       Navigator.of(context).push(MaterialPageRoute(builder: (builder) => ProfileDetail()));
                     }else{
                      
                     }
     });
   }, verificationFailed: (FirebaseException e){
      FocusScope.of(context).unfocus();
                   ScaffoldMessenger.of(context).showSnackBar(
                     SnackBar(content: Text(e.message.toString()),duration: Duration(seconds: 12),)
                   );
   }, codeSent: (String VID, int? resentToken){
     setState(() {
       verificationCode = VID;
     });
   }, codeAutoRetrievalTimeout: (String VID){
       setState(() {
         verificationCode = VID;
       }); 
       
   },
   timeout: Duration(seconds: 50)
   );
   
  }
}
