require 'gherkin/parser'
require 'gherkin/token_scanner'
require_relative 'rules'

module Gherkin
  module Lint
    class Api
      def feature_at(path)
        Feature.new(path)
      end

      class Feature
        def initialize(path)
          @path = path
        end

        def with(gherkin)
          parser  = Gherkin::Parser.new
          scanner = Gherkin::TokenScanner.new(gherkin)
          @feature = parser.parse(scanner)
          self
        end

        def lint(rule, warnings)
          rule.lint(@feature, @path, warnings)
        end
      end
    end
  end
end
