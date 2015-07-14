# gherkin-lint

Writing Gherkin is like cooking.
Adding too many or wrong ingredients will ruin the taste.

Gherin-Lint finds common antipatterns in Gherkin and suggests solutions.

> Perfection is Achieved Not When There Is Nothing More to Add, But When There Is Nothing Left to Take Away.
--Antoine de Saint-Exupéry

## Rules

* [x] Feature description
* [ ] Rules section in description
* [ ] No Emotions (Given I want...)
* [x] Single When steps
* [ ] No When or Then in Background
* [x] No UI speak (click, etc)
* [ ] No UI speak in Scenario Outline
* [ ] No "or" in steps
* [ ] Short scenarios (more than 5 steps)
* [ ] Short sentences
* [ ] Few scenarios in a Feature file
* [ ] Use And (Given, Given)
* [ ] Backwards (Given, When, Given)
* [ ] Small DataTable (avoid incidental detail)
* [ ] Small Examples table (avoid incidental detail)
* [ ] Few arguments (many "xxx" pairs or numbers)
* [ ] Few comments


## Implementation

Gherkin-lint is a ruby library with a UNIX-like CLI:

    gherkin-lint [file ...]

It prints out problems in machine-readable format.
