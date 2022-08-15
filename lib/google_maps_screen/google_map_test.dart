import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/geo_locator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;

  String location = "Location Name:";
  bool _isLoading = false;
  List latlong = [];

  @override
  void initState() {
    getLatLong();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // LatLng startLocation = LatLng(27.6602292, 85.308027);
    LatLng startLocation = _isLoading
        ? const LatLng(31.4242888, 73.0720631)
        : LatLng(latlong[0], latlong[1]);
    return Scaffold(
        appBar: AppBar(
          title: Text("Longitude Latitude Picker in Google Map"),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body: Stack(children: [
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
              width: 80,
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
                        dense: true,
                      )),
                ),
              ))
        ]));
  }

  void getLatLong() async {
    setState(() {
      _isLoading = true;
    });
    latlong = await getLocation().getLatLong();
    debugPrint(latlong.toString());
    setState(() {
      latlong;
      _isLoading = false;
    });
  }
}
