import 'package:city_max/detail/nextdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  String title, subTitle, serviceHours, heros, price;
  String? addr;
  var snap;
  var products;

  double lat, long;
  String loc;

  GoogleMapScreen({
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.price,
    this.snap,
    this.products,
    this.addr,
    Key? key,
    required this.lat,
    required this.long,
    required this.loc,
  }) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  @override
  Widget build(BuildContext context) {
    String googleApikey = "AIzaSyD1PAA4bboQnAw-KFsZ4BXVU74M9jtqHm0";
    GoogleMapController? mapController; //contrller for Google map
    CameraPosition? cameraPosition;
    LatLng startLocation = LatLng(widget.lat, widget.long);
    String location = widget.loc;

    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            //Map widget from google_maps_flutter package
            zoomGesturesEnabled: true, //enable Zoom in, out on map
            initialCameraPosition: CameraPosition(
              //innital position in map
              target: startLocation, //initial position
              zoom: 14.0, //initial zoom level
            ),
            mapType: MapType.normal, //map type
            onMapCreated: (controller) {
              //method called when map is created
              setState(() {
                mapController = controller;
              });
            },
            onCameraMove: (CameraPosition cameraPositiona) {
              cameraPosition = cameraPositiona; //when map is dragging
            },
            onCameraIdle: () async {
              //when map drag stops
              List<Placemark> placemarks = await placemarkFromCoordinates(
                  cameraPosition!.target.latitude,
                  cameraPosition!.target.longitude);
              setState(() {
                //get place name from lat and lang
                location = placemarks.first.administrativeArea.toString() +
                    ", " +
                    placemarks.first.street.toString();
              });
            },
          ),
          Center(
            //picker image on google map
            child: Image.asset(
              "assets/user_loc.png",
              width: 50,
            ),
          ),
          Positioned(
            //widget to display location name
            bottom: 100,
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(0),
                  width: MediaQuery.of(context).size.width - 40,
                  child: ListTile(
                    leading: Image.asset(
                      "assets/user_loc.png",
                      width: 25,
                    ),
                    title: Text(
                      location,
                      style: TextStyle(fontSize: 18),
                    ),
                    subtitle: ElevatedButton(
                      child: Text('Pick'),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => NextDetailPage(
                              title: widget.title,
                              subTitle: widget.subTitle,
                              serviceHours: widget.serviceHours,
                              heros: widget.heros,
                              price: widget.price,
                              addr: location,
                              products: widget.products,
                              snap: widget.snap,
                            ),
                          ),
                        );
                      },
                    ),
                    dense: true,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
