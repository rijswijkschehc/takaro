Feature: Admin Users

  Scenario: Get an overview of users
    Given an admin named "Joost"
    And "Joost" is signed in
    And the admin users page is shown

    Then "joost@takaro.test" is displayed
    And "admin" is displayed
