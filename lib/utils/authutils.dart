import 'package:city_max/main/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';
import 'customdialog.dart';
import 'package:flutter/material.dart';

class AuthUtils{
  


  socialLoginUser(
      BuildContext context
      )async{
    String userName=firebaseAuth.currentUser!.displayName.toString();
    String email=firebaseAuth.currentUser!.email.toString();
    String dob="";
    String gender="";
    String phoneNumber=firebaseAuth.currentUser!.phoneNumber.toString();
    String imageLink=firebaseAuth.currentUser!.photoURL.toString();
    try{

      await firebaseFirestore.collection('users').doc(firebaseAuth.currentUser!.uid).set({
        "id":firebaseAuth.currentUser!.uid,
        'UserName':userName,
        'Email':email,
        "DOB":dob,
        "Gender":gender,
        "Phone Number":phoneNumber,
        "imageLink":imageLink,
        "status":"offline"// 'Password':password
      }).then((value) {
        Customdialog().showInSnackBar("Logged in", context);
        // Provider.of<CircularProgressProvider>(context,listen: false).setValue(false);
        Customdialog.closeDialog(context);
        Navigator.pushAndRemoveUntil(
            context, MaterialPageRoute(builder: (_) => MainScreen()), (
            route) => false);

      });
    }on FirebaseAuthException catch(e){
      Navigator.pop(context);

      Customdialog.showBox(context,e.toString());


    }
  }
  
}