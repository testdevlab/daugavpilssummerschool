Feature: Searching item

@test5
Scenario: searching for an item
  Given I have signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  When I choose the first option in the list
  Then this item has the searched keywords in the title
