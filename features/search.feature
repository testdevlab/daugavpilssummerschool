Feature: search

@search
Scenario: Searching for items
  #Given i have signed in
  And i click on the "Search for anything" field
  And i search for "hockey stick tape" and choose the first option
  And i check and close informative message
  When i choose the first option in the list
  Then this item has the searched keywords in the title
