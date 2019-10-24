import 'package:flutter/material.dart';


class StaticListViewScreen extends StatelessWidget
{
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text('Static List View')),
      body: Bodylayout(),
    );
  }
}
class Bodylayout extends StatelessWidget
{
    Widget build(BuildContext context) {
    return myListView(context);
  }
}

Widget myListView(BuildContext context)
{
  return ListView(
    children: <Widget>[
      ListTile(title: Text('Sunday')),
      ListTile(title: Text('Monday')),
      ListTile(title: Text('Tuesday')),
      ListTile(title: Text('Wednesday')),
      ListTile(title: Text('Thursday')),
      ListTile(title: Text('Friday')),
      ListTile(title: Text('Saturday')),
    ],
  );
}