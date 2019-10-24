import 'package:myapp/Screens/animate_camera.dart';
import 'package:flutter/material.dart';
import 'package:myapp/Screens/map_click.dart';
import 'package:myapp/Screens/mapui.dart';
import 'package:myapp/Screens/page.dart';

final List<Page> _allPages = <Page>[
  MapUiPage(),
  //MapCoordinatesPage(),
 MapClickPage(),
  AnimateCameraPage(),
 // MoveCameraPage(),
 // PlaceMarkerPage(),
 // MarkerIconsPage(),
 // ScrollingMapPage(),
 // PlacePolylinePage(),
 // PlacePolygonPage(),
 // PlaceCirclePage(),
 // PaddingPage(),
];

class MapsDemo extends StatelessWidget {
  void _pushPage(BuildContext context, Page page) {
    Navigator.of(context).push(MaterialPageRoute<void>(
        builder: (_) => Scaffold(
              appBar: AppBar(title: Text(page.title)),
              body: page,
            )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('GoogleMaps examples')),
      body: ListView.builder(
        itemCount: _allPages.length,
        itemBuilder: (_, int index) => ListTile(
          leading: _allPages[index].leading,
          title: Text(_allPages[index].title),
          onTap: () => _pushPage(context, _allPages[index]),
        ),
      ),
    );
  }
}