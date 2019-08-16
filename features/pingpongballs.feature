@balls
Feature: Ping pong balls

@ppballs
Scenario: Ping pong balls
  Given I have signeddd in
  When I click on the "Search for anything" field
  And I input "ping pong balls" in the search field (hint - ID of search field changed after clicking)
  Then all offers include searched keywords
