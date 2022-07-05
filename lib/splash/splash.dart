import 'dart:async';

import 'package:city_max/authphone/continuephone.dart';
import 'package:city_max/onboardingscreens/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 7),
        () =>
         Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Welcome())
              )
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child:
                  Image.asset('assets/splash.png',width: 118.29,height: 60,),)
        ],
      ),
    );;
  }
}