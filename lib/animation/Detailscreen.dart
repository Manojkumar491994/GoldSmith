import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final int index;

  DetailScreen({required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Screen')),
      body: Center(
        child: Hero(
          tag: 'hero-tag-$index',
          child: Image.network('https://via.placeholder.com/600?text=$index'),
        ),
      ),
    );
  }
}
