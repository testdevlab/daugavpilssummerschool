Feature: Authorization

@search
Scenario: Searching for items
  Given I have signed up
  When I click on the "Search for anything" field
  And I input "ping pong balls" in the search field
  Then all offers include searched keywords
