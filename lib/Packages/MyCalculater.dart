import 'package:flutter/material.dart';
import 'package:calculator_utils/calculator_utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final _calculator = Calculator();
  String _result = '';
  double _a =0;
  double _b=0;
  void _calculate(String operation, double a, double b) {
    double result;
    switch (operation) {
      case 'Add':
        result = _calculator.add(a, b);
        break;
      case 'Subtract':
        result = _calculator.subtract(a, b);
        break;
      case 'Multiply':
        result = _calculator.multiply(a, b);
        break;
      case 'Divide':
        result = _calculator.divide(a, b);
        break;
      default:
        result = 0;
    }
    setState(() {
      _result = result.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 1'),
              onChanged: (value) => _a = double.tryParse(value) ?? 0,
            ),
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Enter number 2'),
              onChanged: (value) => _b = double.tryParse(value) ?? 0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _calculate('Add', _a, _b),
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('Subtract', _a, _b),
                  child: Text('Subtract'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('Multiply', _a, _b),
                  child: Text('Multiply'),
                ),
                ElevatedButton(
                  onPressed: () => _calculate('Divide', _a, _b),
                  child: Text('Divide'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Result: $_result', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
