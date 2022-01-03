Feature: Principles

  Background:
    Given a user named "Joost"
    And a principle named "Doelgericht"
    And "Joost" is signed in

  Scenario: Show all principles
    Given the principles page is shown

    Then "Doelgericht" is displayed

  Scenario: Show a specific principle
    Given the principle page for "Doelgericht" is shown

    Then "Doelgericht" is displayed
