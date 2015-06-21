# gherkin-lint

Most people put too much in their Gherkin.
Verbose gherkin makes for bad documentation.

> Perfection is Achieved Not When There Is Nothing More to Add, But When There Is Nothing Left to Take Away.
--Antoine de Saint-Exupéry

Gherin-Lint finds common antipatterns in Gherkin and suggests solutions.

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
* Sentences are too long
* Too many scenarios in a Feature file
* Could use And (Given, Given)
* Large DataTable (incidental detail)
* Large Examples table (incidental detail)
* Many arguments (many "xxx" pairs or numbers)
* Many comments


## Implementation

Gherkin-lint is a ruby library with a UNIX-like CLI:

    gherkin-lint [file ...]

It prints out problems in machine-readable format.
