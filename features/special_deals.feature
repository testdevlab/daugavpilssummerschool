Feature: Special deals

@special_deals
Scenario: Validating special deal categories/tabs
  When I open all deals section
  Then all the expected categories are visible
