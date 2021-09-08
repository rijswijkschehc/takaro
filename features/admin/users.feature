Feature: Admin Users

  Scenario: Get an overview of users
    Given a user named "Joost" with role:
      | administrator |
    And "Joost" is signed in
    And the admin users page is shown

    Then "joost@takaro.test" is displayed
    And "admin" is displayed
