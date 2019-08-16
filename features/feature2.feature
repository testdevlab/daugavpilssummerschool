Feature: search

@test
Scenario Outline: checking that all offers include searched keywords, using variables <input_text> and <user>
  Given I have logged
  When I click on the "Search for anything" field
  And I input "<input_text>" in the search field
  Then all offers include searched keywords
  And I print whatever I passed here "<user>"

  Examples:
  | input_text      | user  |
  | ping pong balls | simple|
  | white shoes     | simple|
  | iphone          | admin |
  | mansion house   | admin |
