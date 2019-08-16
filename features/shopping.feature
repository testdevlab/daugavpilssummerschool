Feature: Shopping

@test1
Scenario: Searching for items
  Given I have signed in
  When I click on the "Search for anything"
  And I input "ping pong balls" in the search field
  Then all offers include searched keywords

@test2
Scenario: Searching for an item
  Given I have signed in
  And I click on the "Search for anything" field
  And I search for random element in the search field
  When I choose the first option in the list
  Then this item has the searched keywords in the title

@test3
Scenario: Adding element to cart
  Given I have signed in
  And I click on the "Search for anything" field
  And I search for random element in the search field
  And I choose the first option in the list
  When I click buy it now
  Then I check if I have "your contact info" field
