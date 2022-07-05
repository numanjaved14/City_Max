import 'dart:ui';


import 'package:city_max/bottom_pages/booking.dart';
import 'package:city_max/bottom_pages/my_homepage.dart';
import 'package:city_max/bottom_pages/noti.dart';
import 'package:city_max/bottom_pages/user.dart';
import 'package:flutter/material.dart';


class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // Properties & Variables needed

  int currentTab = 0; // to keep track of active tab index
  final List<Widget> screens = [
    MyHomePage(),
    Booking(),
    Notifications(),
    User(),
    
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = MyHomePage(); // Our first view in viewport

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
           
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            MyHomePage(); // if user taps on this dashboard tab will be active
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                   Image.asset('assets/home.png',height: 30,width: 30,),
                        Text(
                          'Home',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 10,
                            color: currentTab == 0
                                ? Color(0xff0DC6DF)
                                : Color(0xff8d8282),
                          ),
                        )
                      ],
                    ),
                  ),

                  //Orders
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = Booking();
                        // if user taps on this dashboard tab will be active
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                   Image.asset('assets/deadline.png',height: 30,width: 30,),
                        Text(
                          'Booking',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 10,
                            color: currentTab == 1
                                ? Color(0xff0DC6DF)
                                : Color(0xff8d8282),
                          ),
                        )
                      ],
                    ),
                  ),
               
              Row(
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            Notifications(); // if user taps on this dashboard tab will be active
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                   Image.asset('assets/notification.png',height: 30,width: 30,),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            fontFamily: 'Gilroy',
                            fontSize: 10,
                            color: currentTab == 2
                                ? Color(0xff0DC6DF)
                                : Color(0xff8d8282),
                          ),
                        )
                      ],
                    ),
                  ),

                  ///Create Orders
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen =
                            User(); // if user taps on this dashboard tab will be active
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                   Image.asset('assets/man.png',height: 30,width: 30,),
                        Text(
                          'Profile',
                          style: TextStyle(
                               fontSize: 10,
                            fontFamily: 'Gilroy',
                            color: currentTab == 3
                                ? Color(0xff0DC6DF)
                                : Color(0xff8d8282),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
