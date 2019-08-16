Feature: Special deals

@deal
Scenario: Validating special deal categories/tabs
  When I open all deal section
  Then all the expected categories are visible
