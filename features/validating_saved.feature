Feature: Validating Saved

  @validating_saved
  Scenario: Validating "Saved" section
    When I open the left side section
    And open "Saved" section
    Then the title in the top says "Saved" correctly
