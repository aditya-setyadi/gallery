Feature: Clear Cart
  What ever the cart condition when clear cart button tapped the cart must be clear

  Scenario: Success clear cart after add multiple item
    Given User at Shrine homepage
    When User apply filter "Clothing" category
    And User add "Walter henley (white)" to cart
    When User apply filter "Accessories" category
    And User add "Shrug bag" to cart
    And User open the cart detail
    When User clear the shopping cart
    Then Users cart successfully empty
