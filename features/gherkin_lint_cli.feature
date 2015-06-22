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
      Missing feature description.
      features/bad.feature:2
      Multiple When steps.
      features/bad.feature:5

      """
