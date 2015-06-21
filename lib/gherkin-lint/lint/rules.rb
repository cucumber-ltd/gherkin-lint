module Gherkin
  module Lint
    module Rules
      def self.load(rule_name)
        require_relative("rules/#{rule_name}")
        rule_class_name = rule_name.split('_').collect(&:capitalize).join
        rule_class = const_get('FeatureDescription')
        rule_class.new
      end
    end
  end
end
