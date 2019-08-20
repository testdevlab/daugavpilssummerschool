Feature: Authorization
@aut
Scenario: Registering with a new user
  When I start registration with an email
  And I input personal data
  And I press continue
  And I input my password
  And I finish registration
  Then I have successfully signed up
