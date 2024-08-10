import 'package:flutter/material.dart';

import 'Details.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  List<ContactList> items = [
    ContactList("Manoj", "8grms", "Chain", "Avadi", "Chain", Colors.red),
    ContactList("Saravanan", "16grm", "Ring", "porur", "Ring", Colors.red),
    ContactList("Manoj", "8grms", "Chain", "Avadi", "Chain", Colors.red),
    ContactList("Saravanan", "16grm", "Ring", "porur", "Ring", Colors.red),
    ContactList("Manoj", "8grms", "Chain", "Avadi", "Chain", Colors.red),
    ContactList("Saravanan", "16grm", "Ring", "porur", "Ring", Colors.red),
    ContactList("Manoj", "8grms", "Chain", "Avadi", "Chain", Colors.red),
    ContactList("Saravanan", "16grm", "Ring", "porur", "Ring", Colors.red),
    ContactList("Manoj", "8grms", "Chain", "Avadi", "Chain", Colors.red),
    ContactList("null", "16grm", "Ring", "porur", "Ring", Colors.red),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Container(
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: items.length,
          padding: const EdgeInsets.all(8.0),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                print("on Tap $index");
                setState(() {
                  items[index].indexColor = Colors.green;
                });
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Detials()));
              },
              onLongPress: () {
                print("on Long $index");
                setState(() {
                  items[index].indexColor = Colors.red;
                });
              },
              onDoubleTap: () {
                print("on double $index");
                setState(() {
                  items[index].indexColor = Colors.white;
                });
              },
              child: Card(
                elevation: 10,
                color: items[index].indexColor,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("${items[index].Name}"),
                          Text("${items[index].gram}"),
                        ],
                      ),
                      Text("${items[index].Model}"),
                      Text("${items[index].Category}"),
                      Visibility(
                          visible: false,
                          child: Text("${items[index].Address}")),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      )),
    );
  }
}

class ContactList {
  String? Name;
  String? gram;
  String? Model;
  String? Address;
  String? Category;
  Color? indexColor = Colors.red;

  ContactList(this.Name, this.gram, this.Model, this.Address, this.Category,
      this.indexColor);
}
