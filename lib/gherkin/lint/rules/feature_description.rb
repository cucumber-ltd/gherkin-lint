module Gherkin::Lint::Rules
  class FeatureDescription
    def lint(gherkin_document, path, warnings)
      feature = gherkin_document[:feature]
      if feature[:description].nil?
        line = feature[:location][:line] + 1
        warnings.push << {
          path: path,
          location: {line: line},
          rule: 'feature_description',
          description: "A Feature should have a description"
        }
      end
    end
  end
end
