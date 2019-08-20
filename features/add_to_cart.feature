Feature: adding an item to the cart
  @add
  Scenario: adding an item to the cart
  Given I have signed up
  And I click on "Search for anything"
  And I search "hockey stick tape" in the search field
  And I choose the first option in the suggestion list
  When I choose the first item in goods list
  And I choose the model and color
  And I add the item to the cart
  Then I am asked to input my credit card credentials
