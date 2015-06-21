module Gherkin
  module Lint
    module Rules
      class FeatureDescription
        def lint(ast, warnings)
          if ast[:description].nil?
            warnings.push << "Missing feature description.\nfeatures/no_description.feature:2"
          end
        end
      end
    end
  end
end
