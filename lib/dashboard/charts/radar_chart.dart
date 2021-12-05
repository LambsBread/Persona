import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_charts/multi_charts.dart';

class MyRadarChart extends StatelessWidget {
  const MyRadarChart({Key? key, required this.values}) : super(key: key);

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return RadarChart(
      animate: true,
      maxValue: 10,
      values: values.isNotEmpty ? values : [0, 0, 0, 0, 0],
      labels: [
        "Openness",
        "Conscientiousness",
        "Extroversion",
        "Agreeableness",
        "Neuroticism"
      ],
      labelWidth: 100,
      textScaleFactor: 0.065,
      fillColor: Colors.green,
      maxHeight: 170,
      maxWidth: 170,
    );
  }
}
