Feature: Join

  Background:
    Given the join page is shown

  Scenario: Join with valid credentials
    When the user fills "Email" in with "joost@takaro.test"
    And the user fills "Password" in with "super-secret"
    And the user fills "Password confirmation" in with "super-secret"
    And the user submits the form
    Then an "info" alert containing "A message with a confirmation link has been sent to your email address" is displayed

  Scenario: Join with an invalid password
    When the user fills "Email" in with "joost@takaro.test"
    And the user fills "Password" in with "short"
    And the user fills "Password confirmation" in with "short"
    And the user submits the form
    Then a validation error containing "Password is too short" is displayed
