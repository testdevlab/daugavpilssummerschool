Feature: Authorization

@registration
Scenario: Registering with a new user
  When I start registration with an email
  And I input my personal data
  And I press CONTINUE
  And I input my password
  And I finish registration
  Then I have successfully signed up
