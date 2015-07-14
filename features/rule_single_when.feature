Feature: Rule: Single When

  Scenario: No description
    Given a feature "features/some.feature" with:
      """
      Feature: Hello
        Scenario: hi
          Given a
          When b
          And c
      """
    When it's linted with "single_when"
    Then the warning should be:
      """
      {
        "path": "features/some.feature",
        "location": {
          "line": 5
        },
        "rule": "single_when",
        "description": "A Scenario should have a single When step"
      }
      """
