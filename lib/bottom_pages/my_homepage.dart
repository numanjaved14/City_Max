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
      body: SafeArea(
        child: Column(
          children: [
            CarouselSlider.builder(
              itemCount: Carousel.length,
              options: CarouselOptions(
                  // height: 250,
                  autoPlay: true,
                  viewportFraction: 0.83,
                  enlargeCenterPage: true),
              itemBuilder: (BuildContext context, int index, int page) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    Carousel[index],
                    fit: BoxFit.cover,
                  ),
                );
                // return Container(
                //   child: Stack(
                //     children: [
                //       ClipRRect(
                //         borderRadius: BorderRadius.circular(20),
                //         child: Image.asset(
                //           Carousel[index],
                //           fit: BoxFit.cover,
                //         ),
                //       ),
                //       Container(
                //         decoration: BoxDecoration(
                //             color: Colors.black54.withOpacity(0.3),
                //             borderRadius: BorderRadius.circular(20)),
                //         width: double.infinity,
                //         height: double.infinity,
                //         // color: Colors.black54.withOpacity(0.2),
                //         // child: Center(
                //         //   child: Text(
                //         //     Carousel[index].Text,
                //         //     style: TextStyle(fontSize: 35, color: Colors.white),
                //         //   ),
                //         // ),
                //       )
                //     ],
                //   ),
                // );
              },
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Column(
                //   children: [
                //     Image.asset(
                //       'assets/offer.png',
                //       width: 117,
                //       height: 117,
                //     ),
                //     SizedBox(
                //       height: 5,
                //     ),
                //     Text('Limited Offers')
                //   ],
                // ),
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
                        width: 117,
                        height: 117,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Cleaning')
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 60,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/electrcian.png',
                      width: 117,
                      height: 117,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text('Comming Soon')
                  ],
                ),
                Column(
                  children: [
                    Image.asset(
                      'assets/plumber.png',
                      width: 117,
                      height: 117,
                    ),
                    SizedBox(
                      height: 5,
                    ),
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
