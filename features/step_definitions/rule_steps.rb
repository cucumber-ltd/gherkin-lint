require 'gherkin-lint/lint/api'

Before do
  @api = Gherkin::Lint::Api.new
end

Given(/^a feature "([^"]*)" with:$/) do |path, gherkin|
  # Due to a bug in Cucumber 2.0, the type of gherkin is DocString and not String
  # Cucumber shouldn't leak this internal type out to step definitions
  gherkin = gherkin.to_s
  @feature = @api.feature_at(path).with(gherkin)
end

When(/^it's linted with "(.*)"$/) do |rule_name|
  @warnings = []
  @feature.lint(rule_name, @warnings)
end

Then(/^the warnings should be:$/) do |expected_warning|
  expect(@warnings[0]).to eq(expected_warning)
end
