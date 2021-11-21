import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persona_application/dashboard/mood_tracker.dart';
import 'package:persona_application/dashboard/trait_widget_factory.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
          Container(
              padding: EdgeInsets.all(0),
              height: 250,
              width: 350,
              child: ListView(
                  clipBehavior: Clip.none,
                  physics: PageScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: [
                    TraitWidgetFactory.createBigFiveTraits(),
                    TraitWidgetFactory.createMyersTraits(),
                    TraitWidgetFactory.createSixteenPfTraits(),
                    TraitWidgetFactory.createMyersTraits()
                  ])),
          MoodWidget()
        ])));
  }
}