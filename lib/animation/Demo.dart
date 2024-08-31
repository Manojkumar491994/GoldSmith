import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class demo extends StatefulWidget {
  const demo({super.key});

  @override
  State<demo> createState() => _demoState();
}

class _demoState extends State<demo> {
  List<String> items = [
    "a",
    "b",
    "c",
    "a",
    "b",
    "c",
    "a",
    "b",
    "c",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return constraints.maxWidth < 450
                ? Container(
                    color: Colors.red,
                    child: Text("width${constraints.maxWidth}"),
                  )
                : constraints.maxWidth > 450 &&
                constraints.maxWidth< 800
                    ? Container(
                        color: Colors.green,
                        child:
                            Text("width${constraints.maxWidth}"),
                      )
                    : Container(
                        color: Colors.blue,
                        child:
                            Text("width${constraints.maxWidth}"),
                      );
          },
        ),
      ),
    );
  }
}
