import 'package:e_gold/Navigation/ScreenA.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("'navigation'"),
      ),
      body: SafeArea(
        child: Container(
          child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                  context, '/DetailPage');
            },
            child: Text("A"),
          ),
        ),
      ),
    );
  }
}
