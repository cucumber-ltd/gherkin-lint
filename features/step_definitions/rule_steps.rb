require 'gherkin/lint/api'

Before do
  @api = Gherkin::Lint::Api.new
end

Given(/^a feature "([^"]*)" with:$/) do |path, gherkin|
  @feature = @api.feature_at(path).with(gherkin)
end

When(/^it's linted$/) do
  @warnings = @api.lint(@feature)
end

Then(/^the warnings should be:$/) do |expected_warning|
  expect(@warnings[0]).to eq(expected_warning)
end
