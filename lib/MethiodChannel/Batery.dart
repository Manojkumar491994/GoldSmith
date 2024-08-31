
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Batery extends StatefulWidget {
  const Batery({super.key});

  @override
  State<Batery> createState() => _BateryState();
}

class _BateryState extends State<Batery> {

  MethodChannel platform = MethodChannel('samples.flutter.dev/battery');
  String _batteryLevel="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getBatteryLevel();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("battery $_batteryLevel "),
      ),
    );
  }

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final result = await platform.invokeMethod<int>('getBatteryLevel');
      batteryLevel = 'Battery level at $result % .';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    setState(() {
      _batteryLevel = batteryLevel;
    });
  }
}

