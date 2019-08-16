Feature: Test test

@test111
Scenario: Get name of first 3 categories
  When I press home Button
  And I press categories
  And I press to visible random category
  Then I take names of first 3 categories
