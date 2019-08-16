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
And I input "tape" in the search field
When I choose tape in the list
Then This item has the searched keywords in the title

@add
Scenario: adding an item to the cart

Given I have sign in
And I click on the "Search for anything" field
And I input "tape" in the search field
And I choose tape in the list
And I choose the model and quantity
And I add the item to the cart
Then I am asked to input my credit card credentials
