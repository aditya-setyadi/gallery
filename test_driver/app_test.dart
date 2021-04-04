import 'dart:async';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:glob/glob.dart';
import '../test/apps/shrine/step_definition/cart_step.dart';

Future<void> main() {
  final config = FlutterTestConfiguration()
    ..features = [Glob(r"test/apps/**/feature/**.feature")]
    ..reporters = [
      StdoutReporter(),
      ProgressReporter(),
      TestRunSummaryReporter(),
      JsonReporter(path: './report.json')
    ] // you can include the "StdoutReporter()" without the message level parameter for verbose log information
    // ..hooks = [HookExample()]
    ..stepDefinitions = [
      givenUserAtShrineHomePage(),
      whenUserDoFilteringCategory(),
      aWhenUserAddItemToCart(),
      aWhenuserOpenCartDetail(),
      whenUserClearTheShoppingCart(),
      thenUsersCartSuccessFullyEmpty()
    ]
    // ..customStepParameterDefinitions = [ColourParameter()]
    ..restartAppBetweenScenarios = true
    ..targetAppPath = 'test_driver/app.dart'
    ..exitAfterTestRun = true; // set to false if debugging to exit cleanly
  // ..tagExpression = "@smoke" // uncomment to see an example of running scenarios based on tag expressions
  return GherkinRunner().execute(config);
}
