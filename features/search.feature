Feature: Shoping

@test1
Scenario: Checking that all offers include searched keywords
Given I have logged/signed in
When I click on the "Search for anything" field
And I input "ping pong balls" in the search field (hint - ID of search field changed after clicking)
Then all offers include searched keywords
