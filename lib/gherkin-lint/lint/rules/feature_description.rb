module Gherkin::Lint::Rules
  class FeatureDescription
    def lint(ast, path, warnings)
      if ast[:description].nil?
        line = ast[:location][:line] + 1
        warnings.push << "Missing feature description.\n#{path}:#{line}"
      end
    end
  end
end
