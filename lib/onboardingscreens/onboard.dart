import 'package:city_max/onboardingscreens/onboardingone.dart';
import 'package:city_max/onboardingscreens/onboardingthree.dart';
import 'package:city_max/onboardingscreens/onboardingtwo.dart';
import 'package:city_max/phoneAuthentication/phoneauth.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';


class OnBoardingScreens extends StatefulWidget {
  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

int currentPage = 0;

final _controller = PageController(initialPage: 0);
List<Widget> _pages = [
 
  Column(children: [
    Expanded(child: OnBoradingOne()),
  ]),
  Column(
    children: [
      Expanded(
        child: OnBoardingTwo(),
      ),
    ],
  ),
  Column(
    children: [
      Expanded(
        child: OnBoardingThree(),
      ),
    ],
  ),
 
];

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  @override
  Widget build(BuildContext context) {
    //  Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              children: _pages,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          DotsIndicator(
            dotsCount: _pages.length,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              color: Color(0xffE0E0E0), // Inactive color
              activeColor: Color(0xff2CA8DC),
            ),
          ),

        TextButton(onPressed: (){}, child: Text('Skip',
        style: TextStyle(color: Color(0xff2CA8DC)),)),
        SizedBox(height: 10),
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (builder) => PhoneAuth()));
          }, child: Text('Next'),
          style: ElevatedButton.styleFrom(
            shape: StadiumBorder(),
            primary: Color(0xff2CA8DC),
            fixedSize: Size(330, 50)
          )),
        )
        ],
      ),
    );
  }
}
