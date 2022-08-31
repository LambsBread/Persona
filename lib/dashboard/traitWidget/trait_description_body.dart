import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persona_application/dashboard/charts/radar_chart_builder.dart';
import 'package:persona_application/dashboard/traitWidget/description_text_builder.dart';

class DescriptionBody extends StatelessWidget {
  const DescriptionBody({Key? key, required this.title, required this.labels})
      : super(key: key);

  final String title;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Container(
                      height: 190,
                      child: RadarChartBuilder(
                          title: this.title, labels: this.labels)),
                  SizedBox(height: 20),
                  Text(this.title,
                      style: GoogleFonts.roboto(
                          fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left),
                  SizedBox(height: 20),
                  DescriptionBuilder(title: this.title)
                ],
              ),
            )));
  }
}
