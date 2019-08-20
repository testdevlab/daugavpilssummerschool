Feature: Checking the material list
@mat
Scenario: Checking the material list
  Given I have signed up
  When I open the categories
  And I choose Antiques category
  And I choose Antiquities subcategory
  And I choose Byzantine category option
  Then the correct list of materials are shown
