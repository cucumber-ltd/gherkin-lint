Feature: Rule: Description

  Scenario: No description
    Given a feature "features/no_description.feature" with:
      """
      Feature: Hello
        Scenario: hi
      """
    When it's linted
    Then the warnings should be:
      """
      Missing description.
      features/no_description.feature:2
      """
