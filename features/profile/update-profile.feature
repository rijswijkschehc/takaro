Feature: Update profile

  Background:
    Given a user named "Joost"
    And "Joost" is signed in
    And the profile page is shown

  Scenario: Change the screen name
    When the user submits the form with:
      | Screen name | Henk |
    Then a "success" alert containing "Profile updated successfully" is displayed

  Scenario: Change the email address
    When the user submits the form with:
      | Email            | test@takaro.test |
      | Current password | super-secret     |
    Then a "success" alert containing "Profile updated successfully" is displayed

  Scenario: Change the password
    When the user submits the form with:
      | Password              | slightly-less-secret |
      | Password confirmation | slightly-less-secret |
      | Current password      | super-secret         |
    Then a "success" alert containing "Profile updated successfully" is displayed
