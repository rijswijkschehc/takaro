Feature: Admin equipment locations

  Background:
    Given a user named "Felix" with role:
      | equipment |
    And an equipment location named "Keepersgarage rechts"
    And an equipment lock with number 13 and code "1905"
    And "Felix" is signed in

  Scenario: Get an overview of equipment locations
    When the admin equipment locations page is shown
    Then "Keepersgarage rechts" is displayed

  Scenario: Create a new location
    When the new admin equipment location page is shown
    And the user fills "Name" in with "Locker 1"
    And the user fills "Owner" in with "Nino (H2)"
    And the user selects "Keepersgarage rechts" for "Parent"
    And the user selects "13" for "Lock"
    And the user submits the form

    Then an "info" alert containing "Location created successfully" is displayed
