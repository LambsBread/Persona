import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/charts/radar_chart.dart';

class RadarChartBuilder extends StatelessWidget {
  RadarChartBuilder({Key? key}) : super(key: key);

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
              //this.myersValues = myersScores;

              List<double> bigScores =
              snapshot.data!.get("bigScores").cast<double>();
              return MyRadarChart(values: bigScores);
            } catch (e) {
              print(
                  "A score was not found in database or the format was incorrect");
            }
            return MyRadarChart(values: []);
          }
        });
  }
}
