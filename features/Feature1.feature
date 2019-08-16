Feature: Log in and search

Scenario: Log in to account and search for anything
  When I search for log in button
  And I Log in to account
  And I search for something
  Then I look for search result in item name

@3rdTask
Scenario: Log in, search, choose and checkout
   Given I have logged
   When I searching for something
   And I choose the first option in the list
   And I choose the model and colour
   And I add the item to the cart
   Then I see what I have and go to checkout

@categories
   Scenario: Validating special deal categories/tabs
     When I open all deal section
     Then all the expected categories are visible
