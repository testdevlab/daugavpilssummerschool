Feature: testss

@testss1
Scenario: Validating "Saved" section
  When I open the left side section
  And I open "Saved" section
  Then the title in the top says searched object correctly

@testss2
Scenario: searching for an item
  #Given i have signed in
  And i click on the "Search for anything" field
  And i search for "hockey stick tape" and choose the first option
  And i check and close informative message
  When i choose the first option in the list
  Then this item has the searched keywords in the title

@testss3
Scenario: adding an item to the cart
  #Given i have signed in
  And i click on the "Search for anything" field
  And i search for "hockey stick tape" and choose the first option
  And i check and close informative message
  And i choose the first option in the list

  And I choose the model and color (or other required categories)
  And I add the item to the cart
  Then I am asked to input my credit card credentials
