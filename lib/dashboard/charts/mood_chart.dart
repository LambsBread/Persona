import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

import '../moodWidget/MoodData.dart';

class MoodChart extends StatelessWidget {
  final List<charts.Series<dynamic, String>> seriesList;
  final bool animate;

  MoodChart(this.seriesList, {this.animate = true});

  factory MoodChart.withSampleData(List<MoodData> moods) {
    return MoodChart(
      _createSampleData(moods),
    );
  }

  // [BarLabelDecorator] will automatically position the label
  // inside the bar if the label will fit. If the label will not fit,
  // it will draw outside of the bar.
  // Labels can always display inside or outside using [LabelPosition].
  //
  // Text style for inside / outside can be controlled independently by setting
  // [insideLabelStyleSpec] and [outsideLabelStyleSpec].
  @override
  Widget build(BuildContext context) {
    return charts.BarChart(
      seriesList,
      animate: animate,
      defaultRenderer: new charts.BarRendererConfig(
          cornerStrategy: const charts.ConstCornerStrategy(30)),
      // Set a bar label decorator.
      // Example configuring different styles for inside/outside:
      //       barRendererDecorator: new charts.BarLabelDecorator(
      //          insideLabelStyleSpec: new charts.TextStyleSpec(...),
      //          outsideLabelStyleSpec: new charts.TextStyleSpec(...)),
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      domainAxis: new charts.OrdinalAxisSpec(),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<Mood, String>> _createSampleData(
      List<MoodData> moods) {
    int monday = 0,
        tuesday = 0,
        wednesday = 0,
        thursday = 0,
        friday = 0,
        saturday = 0,
        sunday = 0,
        mondayC = 0,
        tuesdayC = 0,
        wednesdayC = 0,
        thursdayC = 0,
        fridayC = 0,
        saturdayC = 0,
        sundayC = 0;
    for (MoodData data in moods) {
      switch (data.getTimestamp.toDate().weekday) {
        case 1:
          mondayC++;
          monday += data.value;
          break;
        case 2:
          tuesdayC++;
          tuesday += data.value;
          break;
        case 3:
          wednesdayC++;
          wednesday += data.value;
          break;
        case 4:
          thursdayC++;
          thursday += data.value;
          break;
        case 5:
          fridayC++;
          friday += data.value;
          break;
        case 6:
          saturdayC++;
          saturday += data.value;
          break;
        case 7:
          sundayC++;
          sunday += data.value;
          break;
      }
    }

    final data = [
      new Mood('Mon', mondayC != 0 ? monday / mondayC : 0),
      new Mood('Tue', tuesdayC != 0 ? tuesday / tuesdayC : 0),
      new Mood('Wed', wednesdayC != 0 ? wednesday / wednesdayC : 0),
      new Mood('Thu', thursdayC != 0 ? thursday / thursdayC : 0),
      new Mood('Fri', fridayC != 0 ? friday / fridayC : 0),
      new Mood('Sat', saturdayC != 0 ? saturday / saturdayC : 0),
      new Mood('Sun', sundayC != 0 ? sunday / sundayC : 0),
    ];

    return [
      new charts.Series<Mood, String>(
          id: 'mood',
          domainFn: (Mood mood, _) => mood.day,
          measureFn: (Mood mood, _) => mood.mood,
          colorFn: (_, __) =>
              charts.MaterialPalette.green.shadeDefault.darker.darker,
          data: data,
          // Text of the bar label.
          labelAccessorFn: (Mood mood, _) => mood.mood.toString() + " %")
    ];
  }
}

/// Ordinal data type.
class Mood {
  final String day;
  final double mood;

  Mood(this.day, this.mood);
}
