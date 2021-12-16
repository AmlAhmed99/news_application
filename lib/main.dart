import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newsapplication/home_layout/home_layout.dart';
import 'package:newsapplication/screens/searchScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     routes: {
       HomeScreen.homeRourte:(context)=>HomeScreen(),
       SearchScreen.routeNameSearchScreen:(context)=>SearchScreen()
     },
      initialRoute:HomeScreen.homeRourte,
      theme: ThemeData(
        primaryColor: Colors.green,
        scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            elevation: 0,
              color: Colors.transparent,
              centerTitle: true,
              backwardsCompatibility: false,
              systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.green,
                  statusBarIconBrightness: Brightness.light
              ),

          ),
          textTheme: TextTheme(
          headline4: TextStyle(
              color: Colors.white,
              fontSize: 24
          ),
          headline3: TextStyle(
              color: Colors.black,
              fontSize: 18
          ),
        ),

      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

