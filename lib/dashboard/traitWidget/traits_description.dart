import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persona_application/dashboard/traitWidget/trait_description_body.dart';

/// Class for deciding which description should be presented
class TraitDescription extends StatelessWidget {
  const TraitDescription({
    Key? key,
    required this.title, required this.labels,
  }) : super(key: key);

  final String title;
  final List<String> labels;

  @override
  Widget build(BuildContext context) {
    switch (title) {
      case "Big 5 Personality Traits":
        return DescriptionBody(title: this.title, labels: this.labels,);
      case "Myers-Briggs Personality Traits":
        return DescriptionBody(title: this.title, labels: this.labels);
      default:
        return Scaffold(
          body: Align(
            alignment: Alignment.center,
            child: Text(
              "In Development",
              style: GoogleFonts.roboto(fontSize: 25),
            ),
          ),
        );
    }
  }
}
