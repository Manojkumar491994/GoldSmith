// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';
import 'package:e_gold/Features/Login_Scren/View/pages/login_Screen.dart';
import 'package:e_gold/Core/Glass_efect.dart';
import 'package:flutter/material.dart';

class splashScreen extends StatefulWidget {
  const splashScreen({super.key});

  @override
  State<splashScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<splashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 3),
      () =>
          //  Navigator.pushReplacement(
          //         context,
          //         MaterialPageRoute(
          //           builder: (context) => homeScreen(),
          //         ),
          //       )
          //     :
          Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => loginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: h,
            width: w,
            child: Image.asset(
              "Assets/background.png",
              fit: BoxFit.cover,
            ),
          ),
          glassEfect(),
          Center(
            child: Container(
              child: Image.asset("Assets/logo.png"),
            ),
          )
        ],
      ),
    );
  }
}
