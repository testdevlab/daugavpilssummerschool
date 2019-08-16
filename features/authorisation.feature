Feature: authorisation

@register
Scenario: Registering with randomly generated user
  When i start registration with an email
  And i input personal data
  And i press continue
  And i choose my password
  And i finish registration
  Then i have successfully signed up
