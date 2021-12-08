import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/charts/mood_chart_builder.dart';

///This class Is responsible for creating the container of the MoodChart
class MoodWidgetView extends StatelessWidget {
  const MoodWidgetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.yellow, Color(0xff56ab2f)]),
        ),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            //Title
            Text("Mood Tracker",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                color: Color(0xff56ab2f),
                child: Container(
                    width: 125,
                    height: 22,
                    child: Text("How are you?",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18))))
          ]),
          SizedBox(
            height: 15,
          ),
          Container(height: 230, child: MoodChartBuilder())
        ]));
  }
}
