 import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:myapp/utils/navigation_router.dart';
import 'package:myapp/utils/viewcell.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Home.dart';

class RealWorldApp extends StatefulWidget {
  @override
  
  RealWorldState createState() =>  RealWorldState();
}

class RealWorldState extends State<RealWorldApp> {
  var _isLoading = true;
  var videos;

  _fetchData() async {
    final url = 'https://api.letsbuildthatapp.com/youtube/home_feed';
    final response = await http.get(url);
    

    if (response.statusCode == 200) {
      final map = json.decode(response.body);
      final videosJson = map["videos"];

      setState(() {
        _isLoading = false;
        this.videos = videosJson;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        home:  Scaffold(
            appBar:  AppBar(
              title:  Text("Real World App"),
              actions: <Widget>[
                 IconButton(
                  icon:  Icon(Icons.refresh),
                  onPressed: () {
                    print('Reloading triggered!');
                    _fetchData();
                  },
                )
              ],
            ),
            body:  Center(
                child: _isLoading
                    ? CircularProgressIndicator()
                    :  ListView.builder(
                        itemCount: this.videos.length,
                        itemBuilder: (context, i) {
                          final video = this.videos[i];
                           FlatButton(
                            padding: EdgeInsets.all(0.0),
                          child:  VideoCell(video),
                          onPressed: () {
                           print('$i Pressed');
                           Navigator.push(context, 
                            MaterialPageRoute(
                             builder: (context) => DetailPage()
                           ));
                          },
                          );
                        }))));
  }
}

class DetailPage extends StatelessWidget{
  @override
    Widget build(BuildContext context) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text("Details page")
        ),
        body: new Center(child: new Text("Sample"),)
      );
    }
}