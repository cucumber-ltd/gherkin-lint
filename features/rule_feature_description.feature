Feature: Rule: Feature Description

  Scenario: No description
    Given a feature "features/no_feature_description.feature" with:
      """
      Feature: Hello
        Scenario: hi
      """
    When it's linted with "feature_description"
    Then the warning should be:
      """
      {
        "path": "features/no_feature_description.feature",
        "location": {
          "line": 2
        },
        "rule": "feature_description",
        "description": "A Feature should have a description"
      }
      """

  Scenario: Description exists
    Given a feature "features/has_description.feature" with:
      """
      Feature: Hello
        Here is a description yo

        Scenario: hi
      """
    When it's linted with "feature_description"
    Then there shouldn't be any warnings
