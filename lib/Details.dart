import 'package:flutter/material.dart';

class Detials extends StatefulWidget {
  const Detials({super.key});

  @override
  State<Detials> createState() => _DetialsState();
}

class _DetialsState extends State<Detials> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: WillPopScope(
          onWillPop: () async {
             showDialog(
                context: context,
                builder: (BuildContext c) {
                  return AlertDialog(
                    title: Text("Are you Sure"),
                    actions: [
                      TextButton(onPressed: () {}, child: Text("Yes")),
                      TextButton(onPressed: () {}, child: Text("No"))
                    ],
                  );
                });
            return await false;
          },
          child: Placeholder()),
    ));
  }
}
