import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';

StepDefinitionGeneric givenUserAtShrineHomePage() {
  return given<FlutterWorld>('User at Shrine homepage', (context) async {
      // implement your code
    },
  );
}

StepDefinitionGeneric whenUserDoFilteringCategory() {
  return when1<String, FlutterWorld>('User apply filter {string} category',
        (filter, context) async {
    // implement your code
    },
  );
}

StepDefinitionGeneric aWhenUserAddItemToCart() {
  return and1<String, FlutterWorld>('User add {string} to cart',
        (item, context) async {
      // implement your code
    },
  );
}

StepDefinitionGeneric aWhenuserOpenCartDetail() {
  return and<FlutterWorld>('Add open the cart detail', (context) async {
      // implement your code
    },
  );
}

StepDefinitionGeneric whenUserClearTheShoppingCart() {
  return when<FlutterWorld>('User clear the shopping cart', (context) async {
    // implement your code
    },
  );
}

StepDefinitionGeneric thenUsersCartSuccessFullyEmpty() {
  return then<FlutterWorld>('Users cart successfully empty', (context) async {
    // implement your code
    },
  );
}
