@test_log
Feature: Logging in

Scenario Outline:
  When I start signing in with "<user>"
  And I input "<email>", "<password>"
  And I press sign in button
  Then I am signed in

  Examples:
  | user |  email                          | password      |
  |user1 |ashley_heidenreich@kochboyle.name| nWkSuOGdeg261 |
