import 'package:e_gold/Admin.dart';
import 'package:e_gold/grid.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            actions: [
              Icon(Icons.logout_outlined)
            ],
            bottom: const TabBar(
              tabs: [
                Text("Chat"),
                Text("Status"),
                Text("Chat"),
              ],
            ),
            title: const Text('Tabs Demo'),
          ),
          body: const TabBarView(
            children: [
              Grid(),
             Admin(),
              Grid(),

            ],
          ),
        ),
      ),
    );
  }
}

class GridClass {
  String? productName;
  double? productPrize;
  double? productWeight;
  String? productImg;

  GridClass(
      {this.productName,
      this.productPrize,
      this.productWeight,
      this.productImg});
}
