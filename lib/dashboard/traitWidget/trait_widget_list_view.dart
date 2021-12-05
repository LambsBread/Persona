import 'package:flutter/cupertino.dart';
import 'package:persona_application/dashboard/traitWidget/trait_widget_factory.dart';

class TraitWidgetListView extends StatelessWidget {
  const TraitWidgetListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
        clipBehavior: Clip.none,
        physics: PageScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          TraitWidgetFactory.createBigFiveTraits(),
          TraitWidgetFactory.createMyersTraits(),
          TraitWidgetFactory.createSixteenPfTraits()
        ]);
  }
}
