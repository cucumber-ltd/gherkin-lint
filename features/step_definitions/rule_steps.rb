require 'gherkin/lint/api'
require 'gherkin/lint/rules'

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
  rule = Gherkin::Lint::Rules.load(rule_name)
  @feature.lint(rule, @warnings)
end

Then(/^the warning should be:$/) do |expected_warning|
  expect(@warnings.length).to eq(1)
  expect(JSON.pretty_generate(@warnings[0])).to eq(expected_warning)
end

Then(/^there shouldn't be any warnings$/) do
  expect(@warnings).to eq([])
end
