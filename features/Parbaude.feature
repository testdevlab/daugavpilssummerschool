Feature: Andriod automatization parbaude

@scenario0
Scenario: Validating "Saved" section
  When I open the left side section
  And open "Saved" section
  Then the title in the top says "Saved" correctly

@scenario1
Scenario: searching for an item
  Given I have logged in
  When I click on the "Search" field
  And I search "hockey stick tape"
  And I choose the first option in the given list
  Then this item has the searched keywords in the title

@scenario2
Scenario: adding an item to the cart
  Given I have logged in and search for hockey stick tape
#  And I click on the "Search" field
#  And I search "hockey stick tape" in the search field
  And I choose the first option in result list
  And I choose the model and color
  And I add the item to the cart in scenario2
  Then I am asked to input my credit card credentials

# yes, this is a weird thing to test, but I want to see how you'll work with this
@scenario3
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
