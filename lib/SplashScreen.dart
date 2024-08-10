import 'dart:async';

import 'package:e_gold/Admin.dart';
import 'package:e_gold/Glassmarphishm.dart';
import 'package:e_gold/HomeScreen.dart';
import 'package:e_gold/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



import 'package:shared_preferences/shared_preferences.dart';
// Import your home screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? _controller;
  Animation<double>? _animation;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0.0, end: 0.9).animate(_controller!)
      ..addListener(() {
        setState(() {});
      });

    _controller!.forward();

  start();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'Assets/background.png'), // Add your background image here
                  fit: BoxFit.cover,
                ),
              ),
            ),
            GlassmorphicContainer(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ScaleTransition(
                      scale: _animation!,
                      child: Image.asset('Assets/logo.png'), // Your logo here
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void start() async{
    SharedPreferences  _prefs =await   SharedPreferences.getInstance();
     bool? isLogin=await  _prefs.getBool('isLoggedIn');
     int? isAdmin=await  _prefs.getInt('isAdmin');
     print("isLogin $isLogin");
    Timer(Duration(seconds: 5), () {
      if(isLogin==true){
        if(isAdmin==1) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }else{
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => Admin()),
          );
        }
      }else{
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => LoginScreen("manoj","18")),
        );
      }


    });
  }
}
