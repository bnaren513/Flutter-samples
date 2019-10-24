import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';



class PlaceSearchmapscreen extends StatefulWidget {
  @override
  PlaceSearchmapscreenState createState() => PlaceSearchmapscreenState();
}

class PlaceSearchmapscreenState extends State<PlaceSearchmapscreen> {

 // 1
Completer<GoogleMapController> _controller = Completer();
// 2
static final CameraPosition _myLocation =
  CameraPosition(target: LatLng(0, 0),);
//final String text;
// Homescreen({Key key, @required this.text}) : super(key: key);
  // receive data from the FirstScreen as a parameter
  //Homescreen({Key key, @required this.text}) : super(key: key);
  @override  
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: new AppBar(
            title: new Text('Map Demo'),
            backgroundColor: Colors.red,
          ),
  // 1
  body: GoogleMap(
    // 2
    initialCameraPosition: _myLocation,
    // 3
    mapType: MapType.normal,
    // 4
    onMapCreated: (GoogleMapController controller) {
      _controller.complete(controller);
    },
  ),
);
  }
  }