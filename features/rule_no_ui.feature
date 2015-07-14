Feature: Rule: No UI

  Scenario: UI speal
    Given a feature "features/some.feature" with:
      """
      Feature: Hello

        Scenario: hi
          When I click "Log In"
      """
    When it's linted with "no_ui"
    Then the warning should be:
      """
      {
        "path": "features/some.feature",
        "location": {
          "line": 4,
          "column": 12
        },
        "rule": "no_ui",
        "description": "Avoid UI speak in steps"
      }
      """
