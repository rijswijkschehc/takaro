Feature: Sign in

  Background:
    Given a user named "Joost"
    And the sign in page is shown

  Scenario: Sign-in in with valid credentials
    When the user fills "Email" in with "joost@takaro.test"
    And the user fills "Password" in with "super-secret"
    And the user submits the form
    Then an "info" alert containing "Signed in successfully." is displayed

  Scenario: Sign-in with an incorrect password
    When the user fills "Email" in with "joost@takaro.test"
    And the user fills "Password" in with "this-is-wrong"
    And the user submits the form
    Then a "danger" alert containing "Invalid Email or password." is displayed
