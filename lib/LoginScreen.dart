import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {



  @override
  State<LoginScreen> createState() => _LoginScreenState();

  LoginScreen();
}

class _LoginScreenState extends State<LoginScreen> {
  String dataFromSplash2 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: GestureDetector(
        onTap: () => back(),
        child: Container(
          width: 500,
          height: 500,
          color: Colors.red,
          child: Center(
              child: Text(
            "",
            style: TextStyle(fontSize: 50),
          )),
        ),
      ),
    );
  }

  back() {
    Navigator.pop(context, "back Login");
  }
}
