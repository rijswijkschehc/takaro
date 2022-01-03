Feature: Trainings

  Background:
    Given a user named "Joost"
    And a training about "4 vs. 3 overtal" by "Joost"
    And "Joost" is signed in

  Scenario: Show all trainings
    Given the trainings page is shown

    Then "4 vs. 3 overtal" is displayed

  Scenario: Show a specific training
    Given the training page for "4 vs. 3 overtal" is shown

    Then "4 vs. 3 overtal" is displayed
