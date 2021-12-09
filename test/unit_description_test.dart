

import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:persona_application/codex/survey_kit_factory.dart';
import 'package:persona_application/codex/testCard/test_description.dart';
import 'package:survey_kit/survey_kit.dart';


void main(){
  test("test description", ()
  {
    TestDescription description = new TestDescription(
        title: "hello world", image: DecorationImage(
        image: AssetImage(
            'assets/images/bigFive.png')), surveyKit: SurveyKit(task: new OrderedTask(id: TaskIdentifier(id: "234"), steps: [
      InstructionStep(
      title: 'This Test is still under development!',
      text: 'Please try again another time :)',
      buttonText: "I'll be back!",
    )
        ]), onResult: (SurveyResult ) {  },),);
    String ans = description.resolveDescription("type");
    expect(ans, "Default Text");
  });
}