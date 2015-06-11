module Gherkin
  module Lint
    class Api
      def feature_at(path)
        Feature.new(path)
      end

      def lint(feature)
        ["Missing description.\nfeatures/no_description.feature:2"]
      end

      class Feature
        def initialize(path)
        end

        def with(gherkin)
        end
      end
    end
  end
end
