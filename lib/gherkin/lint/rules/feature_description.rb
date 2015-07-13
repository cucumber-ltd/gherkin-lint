module Gherkin::Lint::Rules
  class FeatureDescription
    def lint(ast, path, warnings)
      if ast[:description].nil?
        line = ast[:location][:line] + 1
        warnings.push << {
          path: path,
          location: {line: line},
          rule: 'feature_description',
          description: "Missing feature description"
        }
      end
    end
  end
end
