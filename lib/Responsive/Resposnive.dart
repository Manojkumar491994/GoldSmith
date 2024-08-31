import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Animation Example')),
        body: Center(child: Resposnive()),
      ),
    );
  }
}

class Resposnive extends StatefulWidget {
  const Resposnive({super.key});

  @override
  State<Resposnive> createState() => _ResposniveState();
}

class _ResposniveState extends State<Resposnive> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Container(
                  height: constraints.maxHeight,
                  color: Colors.red,
            
                  child: LayoutBuilder(
                    builder: (BuildContext context, BoxConstraints constraints) {
                      return Container(
                        color: Colors.blue,
                        child: Text("Resposive ${constraints.maxHeight}"),
                        height: constraints.maxHeight,
                        width: constraints.maxWidth,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
