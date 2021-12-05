import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/charts/radar_chart.dart';

class RadarChartBuilder extends StatelessWidget {
  RadarChartBuilder({Key? key, required this.labels, required this.title})
      : super(key: key);

  final String title;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Tests')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text('');
          } else {
            try {
              //List<double> myersScores =
                  //snapshot.data!.get("myersScores").cast<double>();
              List<double> bigScores =
                  snapshot.data!.get("bigScores").cast<double>();
              switch (title) {
                case "Big 5 Personality Traits":
                  return MyRadarChart(values: bigScores, labels: this.labels);
                case "Myers-Briggs Personality Traits":
                  return MyRadarChart(values: [], labels: this.labels);
              }
            } catch (e) {
              print(
                  "A score was not found in database or the format was incorrect");
            }
            return MyRadarChart(
              values: [],
              labels: labels,
            );
          }
        });
  }
}
