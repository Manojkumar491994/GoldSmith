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
        body: Center(child: AnimatedExample()),
      ),
    );
  }
}

class AnimatedExample extends StatefulWidget {
  @override
  _AnimatedExampleState createState() => _AnimatedExampleState();
}

class _AnimatedExampleState extends State<AnimatedExample> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotationAnimation;
  late Animation<Offset> _slideAnimation;
  double width=200.0;
  double height=200.0;
  double container= 1.0;


  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.bounceIn),
    );

    _slideAnimation = Tween<Offset>(begin:Offset(0.0, -2.5) , end: Offset(0.0, 0.0)).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _rotationAnimation = Tween<double>(begin:0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward();

    _controller.addStatusListener((lis){
      print("completed ${lis.index}");
      if(lis.name=="completed"){
        print("yes");
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: (){
        setState(() {
          height=100;
          width=100;
          container=0.5;
        });
      },
      child: AnimatedOpacity(
        opacity: container,
        duration: const Duration(seconds: 2),
        curve: Curves.fastOutSlowIn,
        child: AnimatedContainer(
          duration: const Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
          width: width,
          height: height,
          color: Colors.blue,
          child: Center(
            child: Text(
              'Hello, Flutter!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
