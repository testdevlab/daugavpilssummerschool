Feature: Saved and checking scenarios

@saved
Scenario: Validating "Saved" section
  When I open the left side section
  And open "Saved" section
  Then the title in the top says "Saved" correctly

@checking
Scenario: Checking the material list
    Given I have signed in
    When I open the categories
    And I choose Antiques category
    And I choose Antiquities subcategory
    And I choose Byzantine category option
    Then the correct list of materials are shown
