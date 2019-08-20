@suggestion_list
Feature: Seaching for item and opening item page

Scenario Outline: Checking suggestion list offers
  Given "<user>" with "<email>" and "<passwd>" logged in
  When I click on the "Search for anything" field
  And I input "<search_input>" in the search field
  Then all offers include searched keywords

Examples:
|  user  |           email              |   passwd        | search_input    |
| user1  |  grigra.lagrigra@yandex.ru   |  grilagri3      | white shoes     |




@item_title
Scenario Outline: Checking item title
  Given "<user>" with "<email>" and "<passwd>" signed in
  Given I have clicked on search field
  When I have written "<input_for_search>"
  And I click for searche
  And I open first item from item list
  Then This item has the searched keywords in the title

  Examples:
  |  user  |           email              |   passwd     | input_for_search  |
  | user1  |  grigra.lagrigra@yandex.ru   |  grilagri3   | jacket woman      |
