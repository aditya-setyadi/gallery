import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:gherkin/gherkin.dart';
import 'package:flutter_driver/flutter_driver.dart';

StepDefinitionGeneric givenUserAtShrineHomePage() {
  return given1<String, FlutterWorld>('User at {string} homepage', (galleryName, context) async {
    //declare element to interact
    final desktopNextButton = find.byValueKey('desktopNextButton');
    final chosenGallery = find.byValueKey(galleryName.toLowerCase() + '@study');
    final shrineLoginNextButton = find.byValueKey('shrineLoginNextButton');

    //check visibilityStatus of the desire gallery
    var visibilityStatus = await FlutterDriverUtils.isPresent(
        context.world.driver, chosenGallery);

    //tap next button if the desire gallery not visible
    while (!visibilityStatus) {
      await FlutterDriverUtils.tap(context.world.driver, desktopNextButton);
      visibilityStatus = await FlutterDriverUtils.isPresent(
          context.world.driver, chosenGallery);
    }

    //navigate to shrine gallery landing page (display page after success login)
    await FlutterDriverUtils.tap(context.world.driver, chosenGallery);
    await FlutterDriverUtils.tap(context.world.driver, shrineLoginNextButton);
  });
}

StepDefinitionGeneric whenUserDoFilteringCategory() {
  return when1<String, FlutterWorld>('User apply filter {string} category',
        (filter, context) async {
    final selectedFilterButton = find.byValueKey(filter.toLowerCase() + 'FltrBtn');

    await FlutterDriverUtils.tap(context.world.driver, selectedFilterButton);
  });
}

StepDefinitionGeneric aWhenUserAddItemToCart() {
  return and1<String, FlutterWorld>('User add {string} to cart', (item, context) async {
    final mainItemListContainer = find.byValueKey('mainItemLstCntr');
    final itemToCart = find.byValueKey(item.replaceAll(' ', '').toLowerCase());

    // check item visibility
    var visibilityStatus = await FlutterDriverUtils.isPresent(
        context.world.driver, itemToCart);

    // TODO scrolling until present
    while (!visibilityStatus) {
      await context.world.driver.scrollUntilVisible(
          mainItemListContainer, itemToCart, dyScroll: -150);
    }

    await FlutterDriverUtils.tap(context.world.driver, itemToCart);
  });
}

StepDefinitionGeneric aWhenuserOpenCartDetail() {
  return and<FlutterWorld>('Add open the cart detail', (context) async {
    final addToCartButton = find.byValueKey('addToCartBtn');

    await FlutterDriverUtils.tap(context.world.driver, addToCartButton);
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
