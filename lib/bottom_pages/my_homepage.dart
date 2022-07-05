import 'package:city_max/cleaningstuff/cleaningstuff.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/main.png'),

                        SizedBox(height: 60,),

            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset('assets/offer.png',width: 117,height: 117,),
                    SizedBox(height: 5,),
                    Text('Limited Offers')
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (builder) => CleaningStuff()));
                  },
                  child: Column(
                    children: [
                      Image.asset('assets/clean.png',width: 117,height: 117,),
                      SizedBox(height: 5,),
                      Text('Cleaning')
                    ],
                  ),
                )
              ],
            ),
                        SizedBox(height: 60,),
             Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset('assets/electrcian.png',width: 117,height: 117,),
                    SizedBox(height: 5,),
                    Text('Comming Soon')
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/plumber.png',width: 117,height: 117,),
                    SizedBox(height: 5,),
                    Text('Comming Soon')
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}