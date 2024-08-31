import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class BarChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bar Chart Example")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BarChart(

          BarChartData(
            alignment: BarChartAlignment.spaceEvenly,
            maxY: 20, // Maximum Y value for the chart
            barTouchData: BarTouchData(enabled: true),
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  getTitlesWidget: (value, _) {
                    switch (value.toInt()) {
                      case 0:
                        return Text('Mon');
                      case 1:
                        return Text('Tue');
                      case 2:
                        return Text('Wed');
                      case 3:
                        return Text('Thu');
                      case 4:
                        return Text('Fri');
                      case 5:
                        return Text('Sat');
                      case 6:
                        return Text('Sun');
                      default:
                        return Text('');
                    }
                  },
                ),
              ),
              leftTitles: AxisTitles(
                sideTitles: SideTitles(
                  showTitles: true,
                  interval: 5, // Interval between Y-axis titles
                  reservedSize: 28,
                  getTitlesWidget: (value, _) => Text(value.toInt().toString()),
                ),
              ),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: Colors.grey, width: 1),
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(toY: 8, color: Colors.blue, width: 15)
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(toY: 20, color: Colors.green, width: 15)
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(toY: 10, color: Colors.red, width: 15)
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(toY: 14, color: Colors.yellow, width: 15)
              ]),
              BarChartGroupData(x: 4, barRods: [
                BarChartRodData(toY: 15, color: Colors.purple, width: 15)
              ]),
              BarChartGroupData(x: 5, barRods: [
                BarChartRodData(toY: 13, color: Colors.orange, width: 15)
              ]),
              BarChartGroupData(x: 6, barRods: [
                BarChartRodData(toY: 10, color: Colors.teal, width: 15)
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BarChartSample(),
  ));
}
