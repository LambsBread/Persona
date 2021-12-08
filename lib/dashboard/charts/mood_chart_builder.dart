import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../moodWidget/MoodData.dart';
import 'mood_chart.dart';

/// This class is responsible for accessing the database, giving the data
/// to the MoodChart class and calling the build of the MoodChart
class MoodChartBuilder extends StatelessWidget {
  const MoodChartBuilder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('Moods')
            .where('user', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .where('date',
            isGreaterThan: DateTime.now().subtract(Duration(
                days: DateTime.now().weekday - 1))) //get firstDayOfTheWeek
            .snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return new Text('');
          } else {
            try {
              List<QueryDocumentSnapshot> docSnapList = snapshot.data!.docs;
              List<MoodData> moods = [];
              for (QueryDocumentSnapshot docSnap in docSnapList) {
                moods.add(MoodData(docSnap.get("date"), docSnap.get("value")));
              }
              return MoodChart.withSampleData(moods);
            } catch (e) {
              print("Error in mood Database");
            }
            return MoodChart.withSampleData([]);
          }
        });
  }
}
