Feature: Rule: Multiple When

  Scenario: No description
    Given a feature "features/some.feature" with:
      """
      Feature: Hello
        Scenario: hi
          Given a
          When b
          And c
      """
    When it's linted with "multiple_when"
    Then the warning should be:
      """
      {
        "path": "features/some.feature",
        "location": {
          "line": 5
        },
        "rule": "multiple_when",
        "description": "Multiple When steps"
      }
      """
