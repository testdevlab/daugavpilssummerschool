Feature: adding an item to the cart

@add_item_to_cart
Scenario: adding an item to the cart
  Given I have signed in account
  And I click on the "Search for some item" field
  And I search for some "hockey stick tape" in the search field
  And I choose the first option in the suggested list
  And I choose quantity of item
  And I add the item to the cart
  Then I am asked to input my credit card credentials
