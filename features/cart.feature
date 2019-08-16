Feature: cart

@cart
Scenario: adding an item to the cart
  Given I have signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  And I choose the first option in the list
  And I choose the model and color
  And I add the item to the cart
  Then I am asked to input my credit card credentials
