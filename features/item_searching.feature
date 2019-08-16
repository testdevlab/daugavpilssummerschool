Feature: Searching for an item

@item_searching
Scenario: searching for an item
  Given I have logged in
  When I click on the "Search for an item" field
  And I search for "hockey stick tape" in the search field
  When I choose the first item in the list
  Then this item has the searched keywords in the title
