// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:e_gold/Core/Glass_efect.dart';
import 'package:e_gold/Core/text.dart';
import 'package:e_gold/Features/Login_Scren/View/Widgets/Text_form.dart';
import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  const loginScreen({super.key});

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
              'Assets/login.jpg',
              fit: BoxFit.cover,
            ),
          ),
          glassEfect(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Login',
                      style: txt.logintext(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textForm(
                      label: "Mail ID",
                      icon: Icons.mail,
                      obscure: false,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    textForm(
                      label: "Password",
                      icon: Icons.password,
                      obscure: true,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.red),
                      ),
                      onPressed: () {},
                      child: Container(
                        width: 180,
                        child: Center(
                          child: Text(
                            "login",
                            style: txt.labeltext(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
