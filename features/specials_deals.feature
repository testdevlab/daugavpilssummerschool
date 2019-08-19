Feature: Special deals

@test2
Scenario: Validating special deal categories/tabs
  When I open all deal section
  Then all the expected categories are visible
  | FEATURED | TECH | FASHION | HOME | MORE |
