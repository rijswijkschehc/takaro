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

  Scenario: Get an overview of equipment locations
    Given a user named "Felix" with role:
      | equipment |
    And an equipment location named "Garage 4 (rechts)"
    And "Felix" is signed in
    And the admin equipment locations page is shown

    Then "Garage 4 (rechts)" is displayed
