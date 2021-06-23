Feature: Periods

  Scenario: Show the periods
    Given a user named "Joost"
    And a period named "Somewhere in the season"
    And "Joost" is signed in
    And the period page for "Somewhere in the season" is shown

    Then "Somewhere in the season" is displayed
