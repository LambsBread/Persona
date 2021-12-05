import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget.dart';

abstract class TraitWidgetFactory extends StatelessWidget {
  TraitWidgetFactory({Key? key}) : super(key: key);

  factory TraitWidgetFactory.createBigFiveTraits() {
    return TraitWidget(
        title: "Big 5 Personality Traits",
        labels: [
          "Openness",
          "Conscientiousness",
          "Extroversion",
          "Agreeableness",
          "Neuroticism"
        ]);
  }

  factory TraitWidgetFactory.createMyersTraits() {
    return TraitWidget(
        title: "Myers-Briggs Personality Traits",
        labels: [
          "Extrovert",
          "Sensing",
          "Thinking",
          "Judging",
          "Introvert",
          "Intuition",
          "Feeling",
          "Perception"
        ]);
  }

  factory TraitWidgetFactory.createSixteenPfTraits() {
    return TraitWidget(title: "Sixteen Personality Factors", labels: [
      "Warm",
      "Thinker",
      "Stable",
      "Dominant",
      "Enthusiastic",
      "Conscientious",
      "Bold",
      "Tender",
      "Suspicious",
      "Imaginative",
      "Shrewd",
      "Apprehensive",
      "Experimenting",
      "Self-Sufficient",
      "Controlled",
      "Tense"
    ]);
  }
}