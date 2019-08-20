Feature: task

  @first
  Scenario: Validating "Saved" section
    When I open the left side section
    And open "Saved" section
    Then the title in the top says "Saved" correctly

  @second
  Scenario: searching for an item
    Given I have logged_signed in
    And I click on the "Search for anything" field
    And I search "hockey stick tape" in the search field
    When I choose the first option in the list
    Then this item has the searched keywords in the title

  Scenario: adding an item to the cart
    Given I have logged/signed in
    And I click on the "Search for anything" field
    And I search "hockey stick tape" in the search field
    And I choose the first option in the list
    And I choose the model and color (or other required categories)
    And I add the item to the cart
    Then I am asked to input my credit card credentials

  # yes, this is a weird thing to test, but I want to see how you'll work with this
  Scenario: Checking the material list
    Given I have signed in
    When I open the categories
    And I choose Antiques category
    And I choose Antiquities subcategory
    And I choose Byzantine category option
    Then the correct list of materials are shown
  # Check that each of the materials in the app exists in this list below.
  # Order is not so important, but you can check that as well.
  # ["Bronze", "Gold", "Lead", "Glass", "Copper", "Iron", "Wood", "Paper", "Stone", "Brass", "Pottery", "Terracota"]
