import 'package:city_max/main/mainscreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import 'onboardingscreens/welcome.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Stripe.publishableKey =
      'pk_live_51LIpEeAMqoo5nhPfToaFAmeajAYSH42zfYUyRlWN86aawL6upprF5jhfSJ76C7DD471tWiuLWTYCg5JubUX8veE500zCGlu0wl';

  await Stripe.instance.applySettings();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirebaseAuth.instance.currentUser == null
          ? const Welcome()
          : MainScreen(),
    );
  }
}
