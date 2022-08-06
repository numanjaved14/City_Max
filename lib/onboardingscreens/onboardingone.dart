import 'package:flutter/material.dart';

class OnBoradingOne extends StatefulWidget {
  const OnBoradingOne({Key? key}) : super(key: key);

  @override
  State<OnBoradingOne> createState() => _OnBoradingOneState();
}

class _OnBoradingOneState extends State<OnBoradingOne> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    // Color getColor(Set<MaterialState> states) {
    //   const Set<MaterialState> interactiveStates = <MaterialState>{
    //     MaterialState.pressed,
    //     MaterialState.hovered,
    //     MaterialState.focused,
    //   };
    //   if (states.any(interactiveStates.contains)) {
    //     return Colors.red;
    //   }
    //   return Colors.red;
    // }

    return Scaffold(
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
                    child: Image.asset('assets/aaa.jpeg')),
              ),
              SizedBox(height: 61),
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: 'Discover New and Trendy Services around you!',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                    children: const <TextSpan>[
                      TextSpan(
                        text:
                            ' Best service provider app. The service you want is here to serve you.',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
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
