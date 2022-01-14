Feature: Admin Equipment

  Scenario: Do not show the Equipment link when a user does not have the "equipment" role
    Given a user named "Marjolein"
    And "Marjolein" is signed in

    Then the user menu does not contain the "Equipment" link

  Scenario: Show the Equipment link when a user has the "equipment" role
    Given a user named "Felix" with role:
      | equipment |
    And "Felix" is signed in
    And the authenticated root page is shown

    Then the user menu does contain the "Equipment" link

  Scenario: Add a lock to a location
    Given a user named "Felix" with role:
      | equipment |
    And an equipment location named "Keepersgarage rechts / Locker 4"
    And an equipment lock with number 13 and code "1106"
    And "Felix" is signed in
    And the admin equipment locations page for Keepersgarage rechts / Locker 4 is shown

    When the user selects "13" for "Lock"
    And the user submits the form

    Then "13 / 1106" is displayed
