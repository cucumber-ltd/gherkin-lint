# gherkin-lint
Finds common antipatterns in Gherkin and suggests solutions

## Rules

* Missing description
* No rules section in description
* Emotional (Given I want...)
* More than one When
* Background with When or Then
* UI speak (click, enter)
* Scenario Outline with UI
* Using "or" in steps
* Long scenarios (more than 5 steps)
* Could use And (Given, Given)
* Large DataTable (incidental detail)
* Large Examples table (incidental detail)
* Many arguments (many "xxx" pairs or numbers)
* Many comments

## Implementation

Gherkin-lint is a ruby library with a UNIX-like CLI:

    gherkin-lint [file ...]

It prints out problems in machine-readable format.
