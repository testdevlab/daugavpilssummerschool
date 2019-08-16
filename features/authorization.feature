@authorization
Feature: Authorization

@register
Scenario: Registering with a new user

#Given - precondition
#And -
#When - steps
#And -
#Then - result validation

When I start registration with an email
  And I input personal data
  And I press continue
  And I choose my password
  And I finish registration
  Then I have successfully signed up

@test
Scenario: practicing
  When I print stuff
  And I print specific stuff: "first"
  And I print specific stuff: "second"
  And I print specific stuff: "third"
  And I am a user who wants to print my name
  And I am a admin who wants to print my name


# @example
# Scenario: practicing
#   When I print stuff
#   And I print specific stuff: "<text>"
#   And I am a user who wants to print my name
#   And I am a admin who wants to print my name
#
#   Examples:
#   | text   |
#   | first  |
#   | second |
