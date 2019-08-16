Feature: Special deals

@specialdeal
Scenario: Validating special deal categories or tabs
  When I open all deal section
  Then all the expected categories are visible
