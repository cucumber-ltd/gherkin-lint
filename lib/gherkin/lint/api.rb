require 'gherkin3/parser'
require 'gherkin3/token_scanner'
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
          parser  = Gherkin3::Parser.new
          scanner = Gherkin3::TokenScanner.new(gherkin)
          @feature = parser.parse(scanner)
          self
        end

        def lint(rule_name, warnings)
          rule = Rules.load(rule_name)
          rule.lint(@feature, @path, warnings)
        end
      end
    end
  end
end
