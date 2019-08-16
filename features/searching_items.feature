Feature: Searching for items

@test1
Scenario: Searching for items
  Given I have signed in
  When I click on the "Search for anything"
  And I input "ping pong balls" in the search field
  Then all offers include searched keywords

@test2
Scenario: searching for an item
  Given I have signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  When I choose the first option in the list
  Then this item has the searched keywords in the title

@test3
Scenario: adding an item to the cart
  Given I have signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  And I choose the first option in the list
  And I choose the model and color, or other required categories
  And I add the item to the cart
  Then I am asked to input my credit card credentials

@test4
Scenario: Validating "Saved" section
  When I open the left side section
  And open "Saved" section
  Then the title in the top says "Saved" correctly

@test5
Scenario: Checking the material list
  Given I have signed in
  When I open the categories
  And I choose Antiques category
  And I choose Antiquities subcategory
  And I choose Byzantine category option
  Then the correct list of materials are shown
