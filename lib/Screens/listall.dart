import 'package:flutter/material.dart';
import 'package:myapp/Screens/HorizentalListview.dart';
import 'package:myapp/Screens/Newlist.dart';
import 'package:myapp/Screens/StaticListview.dart';
import 'package:myapp/Screens/card.dart';
import 'package:myapp/Screens/custom_list_view.dart';
import 'package:myapp/Screens/dynamiclistview.dart';
import 'package:myapp/Screens/listStyling.dart';
import 'package:myapp/Screens/touch_detection.dart';
import 'package:myapp/Screens/update_animatedlist.dart';
import 'package:myapp/Screens/updatelistview.dart';
import 'package:myapp/Screens/infinate_list.dart';

class ListAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
     return 
    //MaterialApp(
    //   //debugShowCheckedModeBanner: false,
    //   title: 'ListViews',
    //   theme: ThemeData(
    //     primarySwatch: Colors.teal,
    //   ),
    //   home: 
      Scaffold(
        appBar: AppBar(title: Text('ListViews')),
        body: BodyLayout(),
      );
    //);
  }
}

class BodyLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _myListView(context);
  }
}


Widget _myListView(BuildContext context) {
  return ListView(
    children: <Widget>[
      ListTile(
        title: Text('Static ListView'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, StaticListViewScreen());
        },
      ),
      ListTile(
        title: Text('Dynamic ListView'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, DynamicListViewScreen());
        },
      ),
      ListTile(
        title: Text('Infinite ListView'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, InfiniteListViewScreen());
        },
      ),
      ListTile(
        title: Text('Horizontal ListView'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, HorizontalListViewScreen());
        },
      ),
      ListTile(
        title: Text('ListTile styling'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, ListTileStylingScreen());
        },
      ),
      ListTile(
        title: Text('Cards'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, CardsScreen());
        },
      ),
      ListTile(
        title: Text('Custom list item'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, CustomListItemScreen());
        },
      ),
      ListTile(
        title: Text('Touch detection'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, TouchDetectionScreen());
        },
      ),
      ListTile(
        title: Text('Update ListView'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, UpdateListViewScreen());
        },
      ),
      ListTile(
        title: Text('Update AnimatedList'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, UpdateAnimatedListScreen());
        },
      ),
       ListTile(
        title: Text('New List'),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          _pushScreen(context, NewsList());
        },
      ),
      
    ],
  );
}

void _pushScreen(BuildContext context, Widget screen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => screen),
  );
}