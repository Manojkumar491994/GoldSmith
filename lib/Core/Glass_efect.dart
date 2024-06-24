// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class glassEfect extends StatelessWidget {
  const glassEfect({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
            border: Border.all(
              color: Colors.black.withOpacity(0.2),
            ),
            gradient: LinearGradient(
              colors: [
                Colors.yellowAccent.withOpacity(0.2),
                Colors.red.withOpacity(0.15),
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
          ),
        ),
      ),
    );
  }
}
