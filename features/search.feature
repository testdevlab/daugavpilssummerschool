Feature: Search

@search
Scenario: checking that all offers include searched keywords

Given I have signed in
When I click on the "Search for anything" field
And I input "ping pong balls" in the search field
Then all offers include searched keywords

@item
Scenario: searching for an item

Given I have signed in
And I click on the "Search for anything" field
And I search "hockey stick tape" in the search field
When I choose the first option in the list
Then This item has the searched keywords in the title

@add
Scenario: adding an item to the cart

Given I have signed in
And I click on the "Search for anything" field
And I search "hockey stick tape" in the search field
And I choose the first option in the list
And I choose the model and color
And I add the item to the cart
Then I am asked to input my credit card credentials
