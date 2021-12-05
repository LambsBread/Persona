import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class MyRadarChart extends StatelessWidget {
  const MyRadarChart({Key? key, required this.values, required this.labels})
      : super(key: key);

  final List<double> values;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      animate: true,
      maxValue: 10,
      values: values.isNotEmpty ? values : _resolveValues(),
      labels: labels,
      labelWidth: 100,
      textScaleFactor: 0.065,
      fillColor: Colors.green,
      maxHeight: 170,
      maxWidth: 170,
    );
  }

  List<double> _resolveValues() {
    List<double> valueResolve = [];
    for (int i = 0; i < labels.length; i++) {
      valueResolve.add(0);
    }
    return valueResolve;
  }
}
