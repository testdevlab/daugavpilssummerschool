Feature: search_steps
@search
Scenario: Searching for an item
  Given I have signed up
  When I click on "Search for anything"
  And I search "hockey stick tape" in the search field
  And I choose the first option in the suggestion list
  Then this item has the searched keywords in the title
