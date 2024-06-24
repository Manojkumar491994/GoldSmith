// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class txt {
  static TextStyle logintext() {
    return TextStyle(
      fontSize: 40,
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontFamily: "login",
      shadows: [
        Shadow(
          color: Colors.black,
          blurRadius: 6,
          offset: Offset(4, 4),
        ),
      ],
    );
  }

  static TextStyle labeltext() {
    return TextStyle(
      fontSize: 20,
      color: Colors.white,
      fontWeight: FontWeight.w600,
    );
  }
}
