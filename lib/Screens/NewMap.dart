import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';


class MapsSample extends StatefulWidget {
  @override
  _MapsSampleState createState() => _MapsSampleState();
}

class _MapsSampleState extends State<MapsSample> {

Location location = Location();

  Map<String, double> currentLocation;


  final Set<Marker> _markers = Set();
  final double _zoom = 10;
  CameraPosition _initialPosition = CameraPosition(target: LatLng(26.8206, 30.8025));
  MapType _defaultMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();

//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     location.onLocationChanged().listen((value) {
//       setState(() {
//         currentLocation = value;
//         getcurrentLocation();
//       });
//     });
//   }

 Geolocator geolocator = Geolocator();

  Position userLocation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLocation().then((position) {
      userLocation = position;
      
      getcurrentLocation();
      getcurrentLocation1();
    
    });
  }
Future<Position> _getLocation() async {
    var currentLocation;
    try {
      currentLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }
  Future<void> getcurrentLocation() async {
    double lat = userLocation.latitude.toDouble() ;
    double long = userLocation.longitude.toDouble() ;
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(lat, long);
    print(placemark[0].country);
print(placemark[0].position);
print(placemark[0].locality);
print(placemark[0].administrativeArea);
print(placemark[0].postalCode);
print(placemark[0].name);
//print(placemark[0].subAdministratieArea);
print(placemark[0].isoCountryCode);
print(placemark[0].subLocality);
print(placemark[0].subThoroughfare);
print(placemark[0].thoroughfare);
var address = placemark[0].subLocality + ', ' + placemark[0].locality +  ', ' + placemark[0].administrativeArea ;
var addressname = placemark[0].name ;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      //_markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId(addressname),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: addressname,  snippet: address), onTap: (){
                          launchMaps();
                          
                        }),
                       
                  );
                });
              }
Future<void> getcurrentLocation1() async {
    double lat = 17.686815;
    double long = 83.218483 ;
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(lat, long);
    print(placemark[0].country);
print(placemark[0].position);
print(placemark[0].locality);
print(placemark[0].administrativeArea);
print(placemark[0].postalCode);
print(placemark[0].name);
//print(placemark[0].subAdministratieArea);
print(placemark[0].isoCountryCode);
print(placemark[0].subLocality);
print(placemark[0].subThoroughfare);
print(placemark[0].thoroughfare);
var address = placemark[0].subLocality + ', ' + placemark[0].locality +  ', ' + placemark[0].administrativeArea ;
var addressname = placemark[0].name ;
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      //_markers.clear();
      _markers.add(
        Marker(
            markerId: MarkerId(addressname),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: addressname,  snippet: address, onTap: (){
                          launchMaps();
                          
                        })),
                  );
                });
              }
              void _onMapCreated(GoogleMapController controller) {
                _controller.complete(controller);
              }
            
              void _changeMapType() {
                // setState(() {
                //   _defaultMapType = _defaultMapType == MapType.normal ? MapType.satellite : MapType.normal;
                // });
                //launchMaps();
               // MapUtils.openMap(-3823216.,-38.481700);
                 double lat1 = 17.686815;
    double long1 = 83.218483 ;
               MapUtils.openMap(lat1, long1);
              }
            void launchMaps() async {
              //double lat1 = userLocation.latitude.toDouble() ;
    //double long1 = userLocation.longitude.toDouble() ;
     double lat1 = 17.686815;
    double long1 = 83.218483 ;
  String googleUrl =
    'comgooglemaps://?center=${lat1},${long1}';
  String appleUrl =
    'https://maps.apple.com/?sll=${lat1},${long1}';
  if (await canLaunch("comgooglemaps://")) {
    print('launching com googleUrl');
    await launch(googleUrl);
  } else if (await canLaunch(appleUrl)) {
    print('launching apple url');
    await launch(appleUrl);
  } else {
    throw 'Could not launch url';
  }
 // await launch("google.navigation:q=${lat1},${long1}");
}
            
            
              @override
              Widget build(BuildContext context) {
                return Scaffold(
                    appBar: AppBar(
                      title: Text('Maps in Flutter'),
                      centerTitle: true,
                    ),
                    drawer: _drawer(),
                    body: Stack(
                      children: <Widget>[
                        GoogleMap(
                          markers: _markers,
                          mapType: _defaultMapType,
                          myLocationEnabled: true,
                          onMapCreated: _onMapCreated,
                          initialCameraPosition: _initialPosition,
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 80, right: 10),
                          alignment: Alignment.topRight,
                          child: Column(
                            children: <Widget>[
                              FloatingActionButton(
                                  child: Icon(Icons.layers),
                                  elevation: 5,
                                  backgroundColor: Colors.teal[200],
                                  onPressed: () {
                                    _changeMapType();
                                    print('Changing the Map Type');
                                  }),
                            ],
                          ),
                        ),
                        
            
                      ],
                    ),
                );
              }
            
              Widget _drawer(){
                return Drawer(
                  elevation: 16.0,
                  child: Column(
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text("xyz"),
                        accountEmail: Text("xyz@gmail.com"),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text("xyz"),
                        ),
                        otherAccountsPictures: <Widget>[
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text("abc"),
                          )
                        ],
                      ),
                      ListTile(
                        title: new Text("Places"),
                        leading: new Icon(Icons.flight),
                      ),
                      Divider(),
                      ListTile(
                        onTap: (){
                          _goToNewYork();
                          Navigator.of(context).pop();
                        },
                        title: new Text("New York"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: (){
                          _goToNewDelhi();
                          Navigator.of(context).pop();
                        },
                        title: new Text("New Delhi"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: (){
                          _goToLondon();
                          Navigator.of(context).pop();
                        },
                        title: new Text("London"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: (){
                          _goToTokyo();
                          Navigator.of(context).pop();
                        },
                        title: new Text("Tokyo"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: (){
                          _goToDubai();
                          Navigator.of(context).pop();
                        },
                        title: new Text("Dubai"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: (){
                          _goToParis();
                          Navigator.of(context).pop();
                        },
                        title: new Text("Paris"),
                        trailing: new Icon(Icons.arrow_forward_ios),
                      )
                    ],
                  ),
                );
              }
            
            
              Future<void> _goToNewYork() async {
                double lat = 40.7128;
                double long = -74.0060;
                GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('newyork'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'New York', snippet: 'Welcome to New York')
                    ),
                  );
                });
              }
            
              Future<void> _goToNewDelhi() async {
                double lat = 28.644800;
                double long = 77.216721;
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('newdelhi'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'New Delhi',  snippet: 'Welcome to New Delhi')),
                  );
                });
              }
            
              Future<void> _goToLondon() async {
                double lat = 51.5074;
                double long = -0.1278;
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('london'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'London',  snippet: 'Welcome to London')),
                  );
                });
              }
            
              Future<void> _goToTokyo() async {
                double lat = 35.6795;
                double long = 139.77171;
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('tokyo'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'Tokyo',  snippet: 'Welcome to Tokyo')),
                  );
                });
              }
            
              Future<void> _goToDubai() async {
                double lat = 25.2048;
                double long =55.2708;
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('dubai'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'Dubai',  snippet: 'Welcome to Dubai')),
                  );
                });
              }
            
              Future<void> _goToParis() async {
                double lat = 48.8566;
                double long = 2.3522;
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
                setState(() {
                  _markers.clear();
                  _markers.add(
                    Marker(
                        markerId: MarkerId('paris'),
                        position: LatLng(lat, long),
                        infoWindow: InfoWindow(title: 'Paris',  snippet: 'Welcome to Paris')),
                  );
                });
              }
              
            }
            
            
class MapUtils {

  static openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
       print('Could not open the map.');
      throw 'Could not open the map.';
     
    }

  //   String googleUrl =
  //   'comgooglemaps://?center=${lat1},${long1}';
  // String appleUrl =
  //   'https://maps.apple.com/?sll=${lat1},${long1}';
  // if (await canLaunch("comgooglemaps://")) {
  //   print('launching com googleUrl');
  //   await launch(googleUrl);
  // } else if (await canLaunch(appleUrl)) {
  //   print('launching apple url');
  //   await launch(appleUrl);
  // } else {
  //   throw 'Could not launch url';
  // }
  }
}