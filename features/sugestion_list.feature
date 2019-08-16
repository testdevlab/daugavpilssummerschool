@test_search
Feature: Suggestion list check

Scenario Outline:
  Given I did logging_in
  When I click on the "Search for anything" field
  And I input "<search_input>" in the search field
  Then all offers include searched keywords

Examples:
| search_input    |
| iphone          |
| white shoes     |



@open_item_page
Scenario Outline:
  # Given I did logging_in
  # Given I have clicked on search field
  When I have written "<input_for_search>"
  And I click for searche
  And I open first item from item list
  Then This item has the searched keywords in the title

  Examples:
  | input_for_search |
  | jacket woman     |
