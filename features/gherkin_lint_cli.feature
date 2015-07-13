Feature: gherkin-lint command line interface

  Scenario: run with file argument
    Given a file named "features/bad.feature" with:
      """
      Feature:
        Scenario:
          Given a
          When b
          And c
      """
    And I run `cucumber-lint features/bad.feature`
    Then the output should contain exactly:
      """
      [
        {
          "path": "features/bad.feature",
          "location": {
            "line": 2
          },
          "rule": "feature_description",
          "description": "Missing feature description"
        },
        {
          "path": "features/bad.feature",
          "location": {
            "line": 5
          },
          "rule": "multiple_when",
          "description": "Multiple When steps"
        }
      ]

      """
