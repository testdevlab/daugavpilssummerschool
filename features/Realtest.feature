Feature: Exam

@bigtest1
Scenario: Validating "Saved" section
  When I open the left side section
  And open "Saved" section
  Then the title in the top says "Saved" correctly


@bigtest2
Scenario: searching for an item
  Given I have logged signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  When I choose the first option in the list
  Then this item has the searched keywords in the title


@bigtest3
Scenario: adding an item to the cart
  Given I have logged signed in
  And I click on the "Search for anything" field
  And I search "hockey stick tape" in the search field
  And I choose the first option in the list
  And I choose the model and color or other required categories
  And I add the item to the cart
  Then I am asked to input my credit card credentials

@bigtest4
Scenario: Checking the material list
  #Given I have logged signed in
  When I open the categories
  And I choose Antiques category
  And I choose Antiquities subcategory
  And I choose Byzantine category option
  Then the correct list of materials are shown
