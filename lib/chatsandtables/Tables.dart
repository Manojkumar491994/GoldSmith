import 'package:flutter/material.dart';

class SimpleTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Simple DataTable Example")),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('ID')),
            DataColumn(label: Text('Name')),
            DataColumn(label: Text('Age')),
            DataColumn(label: Text('Gender')),
          ],
          rows: [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Alice')),
              DataCell(Text('23')),
              DataCell(Text('MAle')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Bob')),
              DataCell(Text('27')),
              DataCell(Text('Male')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Charlie')),
              DataCell(Text('30')),
              DataCell(Text('MAle')),
            ]),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SimpleTable(),
  ));
}
