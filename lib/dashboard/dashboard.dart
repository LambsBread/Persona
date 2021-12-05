import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_list_view.dart';

import 'moodWidget/mood_widget.dart';


class Dashboard extends StatelessWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(0),
            height: 250,
            width: 350,
            child: TraitWidgetListView(),
          ),
          MoodWidget(),
        ],
      ),
    );
  }
}
