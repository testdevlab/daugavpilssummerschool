Feature: Saved section

@test4
Scenario: Validating "Saved" section
  When I open the left side section
  And open "Saved" section
  Then the title in the top says "Saved" correctly
