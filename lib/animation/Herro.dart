import 'package:flutter/material.dart';

import 'Demo.dart';
import 'Detailscreen.dart';

void main() {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: demo(),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hero Animation Example')),
      body: ListView(
        children: List.generate(
          5,
              (index) => ListTile(
            leading: Hero(
              tag: 'hero-tag-$index',
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://via.placeholder.com/150?text=$index'),
              ),
            ),
            title: Text('Item $index'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(index: index),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
