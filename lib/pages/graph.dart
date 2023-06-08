import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class graph extends StatelessWidget {
  const graph({super.key});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(),
      swapAnimationDuration: Duration(milliseconds: 150), // Optional
      swapAnimationCurve: Curves.linear, // Optional
    );
  }
}
