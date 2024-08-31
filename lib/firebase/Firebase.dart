import 'package:e_gold/firebase/CRUD.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Reg.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> loginUser() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print("User logged in");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>CrudPage()));
    } catch (e) {
      print("Error: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    getFcm();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password')),
            ElevatedButton(onPressed: loginUser, child: Text('Login')),
            ElevatedButton(onPressed: register, child: Text('Login')),
          ],
        ),
      ),
    );
  }

  void register() {

    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterPage()));
  }

  void getFcm() async{
    try {

      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      FirebaseMessaging.instance
          .getInitialMessage()
          .then((RemoteMessage? message) {
            print("message ${message?.data}");

      });

      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
        print("message ${message!.data}");
      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {

        print("message ${message.data}");
      });
    } on Exception catch (e) {
      print(e);
    }
  }
}
