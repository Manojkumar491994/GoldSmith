

import 'package:flutter/material.dart';
import 'package:fita_cal/fita_cal.dart';
import 'package:flutter/services.dart';

class FitaCal extends StatefulWidget {
  const FitaCal({super.key});

  @override
  State<FitaCal> createState() => _FitaCalState();
}

class _FitaCalState extends State<FitaCal> {
  final _calcs=CalculatorFita();
  double _a=0.0;
  double _b=0.0;
  double _result=0.0;
  String _batteryLevel = 'Unknown battery level.';

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

  _calculate(String s, double a, double b) async{

    double result;
    switch(s){
      case 'Add':


        result = _calcs.add(a, b);

        break;
      case 'Subtract':
        result = _calcs.subtract(a, b);
        break;
      case 'Multiply':
        result= _calcs.multiply(a, b);
        break;
      case 'Divide':

        result = _calcs.divide(a, b);
        break;

      default :

        result=0.0;

    }
    setState(() {
      _result = result;
    });
  }

}

