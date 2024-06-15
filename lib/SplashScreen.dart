import 'package:e_gold/LoginScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var fromLogin;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    startCount().then((value) => print("value from then $value"));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('Assets/logo.jpg'),
              Text("$fromLogin"),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> startCount() async {
    bool isTrue = false;
    await Future.delayed(Duration(seconds: 5)).then((value) {
      print("value $value");
      isTrue = true;
      Navigator.pushNamed(context, '/login');
    });
    return isTrue;
  }
}
