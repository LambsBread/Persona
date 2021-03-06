import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/charts/radar_chart_builder.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';
import 'package:persona_application/dashboard/traitWidget/traits_description.dart';

/// Main Widget used on the dashboard for displaying radar chart
/// and scores of the surveys
class TraitWidget extends StatelessWidget implements TraitWidgetFactory {
  const TraitWidget({Key? key, required this.title, required this.labels})
      : super(key: key);

  final String title;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Card(
            margin: EdgeInsets.fromLTRB(8, 15, 6, 5),
            shadowColor: Colors.grey,
            elevation: 7,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
            child: GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return TraitDescription(
                        title: this.title, labels: this.labels);
                  }));
                },
                child: Container(
                    alignment: Alignment.center,
                    height: 260,
                    width: 335,
                    padding: EdgeInsets.fromLTRB(8, 5, 0, 15),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(width: 5),
                                Text(this.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18))
                              ]),
                          SizedBox(height: 5),
                          RadarChartBuilder(title: title, labels: labels)
                        ])))));
  }
}
