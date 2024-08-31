import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';



class TickerExample extends StatefulWidget {
  @override
  _TickerExampleState createState() => _TickerExampleState();
}

class _TickerExampleState extends State<TickerExample> with SingleTickerProviderStateMixin {
  Ticker? _ticker;
  int _elapsedTicks = 0;

  @override
  void initState() {
    super.initState();

    // Initialize the Ticker
    _ticker = this.createTicker((Duration elapsed) {
      // Update the state on every tick
      setState(() {
        _elapsedTicks = elapsed.inSeconds;
      });
    });

    // Start the ticker
    _ticker!.start();
  }

  @override
  void dispose() {
    // Make sure to stop the ticker when the widget is disposed
    _ticker!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ticker Example")),
      body: Center(
        child: Text("Elapsed time: $_elapsedTicks seconds"),
      ),
    );
  }
}

void main() => runApp(MaterialApp(home: TickerExample()));
