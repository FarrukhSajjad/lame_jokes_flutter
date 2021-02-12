import 'package:flutter/material.dart';
import 'package:random_jokes/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lame Jokes',
      theme: ThemeData(),
      home: SplashScreen(),
    );
  }
}
