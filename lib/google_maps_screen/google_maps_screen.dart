import 'package:city_max/detail/nextdetailpage.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../services/geo_locator.dart';

class GoogleMapScreen extends StatefulWidget {
  String title, subTitle, serviceHours, heros, price;
  // String? addr;
  var snap;
  var products;

  // double lat, long;
  // String loc;

  GoogleMapScreen({
    required this.title,
    required this.subTitle,
    required this.serviceHours,
    required this.heros,
    required this.price,
    this.snap,
    this.products,
    // this.addr,
    Key? key,
    // required this.lat,
    // required this.long,
    // required this.loc,
  }) : super(key: key);

  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  String googleApikey = "AIzaSyBffT8plN_Vdcd308KgmzIfGVQN6q-CkAo";
  GoogleMapController? mapController; //contrller for Google map
  CameraPosition? cameraPosition;
  bool _isLoading = false;
  List latlong = [];
  String location = 'Please move map to A specific location.';
  TextEditingController _addrController = TextEditingController();

  @override
  void initState() {
    getLatLong();
    super.initState();
  }

  @override
  void dispose() {
    _addrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _appartmentController = TextEditingController();
    TextEditingController _buildingController = TextEditingController();
    TextEditingController _streetController = TextEditingController();
    TextEditingController _areaController = TextEditingController();
    LatLng startLocation = _isLoading
        ? const LatLng(25.276987, 55.296249)
        : LatLng(latlong[0], latlong[1]);

    return Scaffold(
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator.adaptive(),
            )
          : Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: 400,
                  child: Stack(
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
                          cameraPosition =
                              cameraPositiona; //when map is dragging
                        },
                        onCameraIdle: () async {
                          //when map drag stops
                          List<Placemark> placemarks =
                              await placemarkFromCoordinates(
                                  cameraPosition!.target.latitude,
                                  cameraPosition!.target.longitude);
                          setState(() {
                            //get place name from lat and lang
                            location =
                                placemarks.first.administrativeArea.toString() +
                                    ", " +
                                    placemarks.first.street.toString();
                            _addrController.text = location;
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
                                title: TextField(
                                  controller: _addrController,
                                  decoration: InputDecoration(
                                    hintText: 'Select Location',
                                  ),
                                ),
                                // title: Text(
                                //   location,
                                //   style: TextStyle(fontSize: 18),
                                // ),
                                // subtitle: ElevatedButton(
                                //   child: Text('Pick'),
                                //   onPressed: () {
                                //     Navigator.of(context).pushReplacement(
                                //       MaterialPageRoute(
                                //         builder: (context) => NextDetailPage(
                                //           title: widget.title,
                                //           subTitle: widget.subTitle,
                                //           serviceHours: widget.serviceHours,
                                //           heros: widget.heros,
                                //           price: widget.price,
                                //           addr: _addrController.text,
                                //           products: widget.products,
                                //           snap: widget.snap,
                                //         ),
                                //       ),
                                //     );
                                //   },
                                // ),
                                dense: true,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: ListTile(
                              title: Text('Appartment'),
                              subtitle: TextField(
                                controller: _appartmentController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Appartment',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: ListTile(
                              title: Text('Building'),
                              subtitle: TextField(
                                controller: _buildingController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Building',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: ListTile(
                              title: Text('Street Number'),
                              subtitle: TextField(
                                controller: _streetController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Street Number',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Card(
                            child: ListTile(
                              title: Text('Area and District'),
                              subtitle: TextField(
                                controller: _areaController,
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Area and District',
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                fixedSize: Size(200, 60),
                                shape: StadiumBorder()),
                            onPressed: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) => NextDetailPage(
                                    title: widget.title,
                                    subTitle: widget.subTitle,
                                    serviceHours: widget.serviceHours,
                                    heros: widget.heros,
                                    price: widget.price,
                                    addr:
                                        '${_appartmentController.text}, ${_buildingController.text}, ${_streetController.text}, ${_areaController.text}, ${_addrController.text}',
                                    products: widget.products,
                                    snap: widget.snap,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Pick'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  void getLatLong() async {
    setState(() {
      _isLoading = true;
    });
    latlong = await getLocation().getLatLong();
    setState(() {
      latlong;
      _isLoading = false;
    });
  }
}
