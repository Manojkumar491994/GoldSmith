// ignore_for_file: prefer_const_constructors

import 'package:e_gold/Features/Splash_Scren/View/pages/Splash_Screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: splashScreen(),
    );
  }
}
