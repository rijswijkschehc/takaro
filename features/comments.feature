@javascript
Feature: Comments

  Scenario Outline: Adding a comment
    Given a user named "Marjolein"
    And "Marjolein" is signed in
    And a <commentable> about "<title>" by "Marjolein"
    And the <commentable> page for "<title>" is shown

    When the user comments with "That is awesome!"

    Then "That is awesome!" is displayed

    Examples:
      | commentable | title             |
      | training    | Omschakelen       |
      | exercise    | 4 vs. 3 uitspelen |
