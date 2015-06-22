Feature: Rule: Multiple When

  Scenario: No description
    Given a feature "features/some.feature" with:
      """
      Feature: Hello
        Scenario: hi
          Given a
          When b
          When c
      """
    When it's linted with "multiple_when"
    Then the warning should be:
      """
      Multiple When steps.
      features/some.feature:5
      """
