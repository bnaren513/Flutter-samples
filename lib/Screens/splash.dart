import 'dart:async';

import 'package:flutter/material.dart';
import 'package:myapp/Screens/List.dart';
import 'package:myapp/utils/navigation_router.dart';
import 'package:myapp/utils/util.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Home.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  get children => null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 5), () => dataLoad());
  }
  
  Future dataLoad()
  async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
     print('Password: ${prefs.getBool('boolValue')}');
    if  (prefs.getBool('boolValue') == true)
    {
      Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Homescreen(),
    ));

    }
    else
    {
      NavigationRouter.switchToLogin(context);
    //   Navigator.push(
    // context,
    // MaterialPageRoute(
    //   builder: (context) => RealWorldApp(),
    // ));
     }
  }

  @override
//    Widget build (BuildContext context)
//    {
//      return Scaffold(
//         body: Stack(
//           children: <Widget>[ 
           
//            Expanded(
//                 //flex: 4,
//                 child: Center(

//                   child: Column(
//                     //mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       FlutterLogo(
//                         size: 100.0,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(top: 10.0),
//                       ),
//                       Text(
//                         Util.name,
//                         style: TextStyle(
//                             color: Colors.white70,
//                             fontWeight: FontWeight.bold,
//                             fontSize: 24.0),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//             ),
//         backgroundColor:  Colors.deepPurple,
//        // backgroundColor: Colors.deepPurpleAccent,
//      );
//    }
// }
  Widget build(BuildContext context) {
    //var util = Util;
       // var name;
                return Scaffold(
                  body: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(color: Colors.deepPurple),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Container(
            
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  FlutterLogo(
                                    size: 100.0,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 10.0),
                                  ),
                                  Text(
                                    Util.name,
                        style: TextStyle(
                            color: Colors.white70,
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0),
                      )
                    ],
                  ),
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}
