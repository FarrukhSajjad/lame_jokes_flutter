import 'dart:async';

import 'package:flutter/material.dart';
import 'package:random_jokes/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 1),
      () =>
          Navigator.push(context, MaterialPageRoute(builder: (ctx) => Home())),
    );
  }

  @override
  void dispose() {
    SplashScreen();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => SplashScreen()));
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: Container(
          height: 200,
          width: 200,
          child: Image.asset('assets/splash.png'),
        )),
      ),
    );
  }
}
