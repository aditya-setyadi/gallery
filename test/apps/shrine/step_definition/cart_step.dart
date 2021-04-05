import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

StepDefinitionGeneric givenUserAtShrineHomePage() {
  return given<FlutterWorld>('User at Shrine homepage', (context) async {
    //declare element to interact
    final chosenGallery = find.text('Shrine');
    final shrineLoginNextButton = find.text('NEXT');

    //navigate to shrine gallery landing page (display page after success login)
    await context.world.driver.scrollIntoView(chosenGallery);
    await FlutterDriverUtils.tap(context.world.driver, chosenGallery);
    await FlutterDriverUtils.tap(context.world.driver, shrineLoginNextButton);
  });
}

StepDefinitionGeneric whenUserDoFilteringCategory() {
  return when1<String, FlutterWorld>('User apply filter {string} category',
        (filter, context) async {
    final filterButton = find.byValueKey('filterDrawer');
    final categorySelected = find.text(filter);

    await FlutterDriverUtils.tap(context.world.driver, filterButton);
    await FlutterDriverUtils.tap(context.world.driver, categorySelected);
  });
}

StepDefinitionGeneric aWhenUserAddItemToCart() {
  return and1<String, FlutterWorld>('User add {string} to cart', (item, context) async {
    final prodLstPanel = find.byValueKey('prodLstPanel');
    final itemToCart = find.text(item);

    // check item visibility
    var visibilityStatus = await FlutterDriverUtils.isPresent(
        context.world.driver, itemToCart);

    var xRetry = 3;
    while (!visibilityStatus && xRetry < 4) {
      await context.world.driver.scrollUntilVisible(
          prodLstPanel, itemToCart, dxScroll: -150);
      xRetry += 1;
    }

    await FlutterDriverUtils.tap(context.world.driver, itemToCart);
  });
}

StepDefinitionGeneric aWhenuserOpenCartDetail() {
  return and<FlutterWorld>('User open the cart detail', (context) async {
    final addToCartButton = find.byValueKey('addToCartBtn');

    await FlutterDriverUtils.tap(context.world.driver, addToCartButton);
    },
  );
}

StepDefinitionGeneric whenUserClearTheShoppingCart() {
  return when<FlutterWorld>('User clear the shopping cart', (context) async {
    final clearCartButton = find.byValueKey('clrCartBtn');

    await FlutterDriverUtils.tap(context.world.driver, clearCartButton);
  });
}

StepDefinitionGeneric thenUsersCartSuccessFullyEmpty() {
  return then<FlutterWorld>('Users cart successfully empty', (context) async {
    final addToCartButton = find.byValueKey('addToCartBtn');
    final cartItemCounterLabel = find.byValueKey('cartItemCounter');

    print(cartItemCounterLabel.serialize());
    await FlutterDriverUtils.tap(context.world.driver, addToCartButton);
  });
}
