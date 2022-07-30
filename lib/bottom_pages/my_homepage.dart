import 'package:city_max/cleaningstuff/cleaningstuff.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List Carousel = [
      'assets/apartment-cleaning.jpg',
      'assets/commercial-disinfection.jpg',
      'assets/housekeeping-with-materials.jpg',
      'assets/rasidential-apartment-disinfection.jpeg',
      'assets/villa-disinfection.jpg',
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: Carousel.length,
              options: CarouselOptions(
                  height: MediaQuery.of(context).size.height,
                  autoPlay: true,
                  viewportFraction: 1,
                  enlargeCenterPage: true),
              itemBuilder: (BuildContext context, int index, int page) {
                return ClipRRect(
                  // borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    Carousel[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            Positioned(
              top: 200,
              child: Card(
                color: Colors.white.withOpacity(0.7),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 25),
                      child: Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => CleaningStuff(),
                              ),
                            );
                          },
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/clean.png',
                                width: 100,
                                height: 100,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Cleaning')
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/electrcian.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Comming Soon')
                          ],
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          children: [
                            Image.asset(
                              'assets/plumber.png',
                              width: 100,
                              height: 100,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Comming Soon')
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              'Your Safety is Our Priority',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            )),
                            SizedBox(
                              height: 5,
                            ),
                            Center(
                                child: Text(
                              'We take strict precautionary measures to keep you \n safe from COVID-19',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12),
                              textAlign: TextAlign.center,
                            )),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
