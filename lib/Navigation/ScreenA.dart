import 'package:flutter/material.dart';

class ScreenA extends StatefulWidget {
  const ScreenA({super.key});

  @override
  State<ScreenA> createState() => _ScreenAState();
}

class _ScreenAState extends State<ScreenA> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("A"),),
      body: Column(
        children: [
          Center(child: Text("A")),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("back"),
          ),
        ],
      ),
    );
  }
}
