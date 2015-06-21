Feature: Rule: Description

  Scenario: No description
    Given a feature "features/no_description.feature" with:
      """
      Feature: Hello
        Scenario: hi
      """
    When it's linted with "feature_description"
    Then the warnings should be:
      """
      Missing feature description.
      features/no_description.feature:2
      """
