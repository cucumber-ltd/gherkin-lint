module Gherkin
  module Lint
    module Rules
      class << self
        def each(&block)
          Dir["#{File.dirname(__FILE__)}/rules/*.rb"].each do |rule_file|
            require rule_file
            rule_name = File.basename(rule_file)[0..-4] # strip .rb
            yield load_class(rule_name)
          end
        end

        def load(rule_name)
          require_relative("rules/#{rule_name}")
          load_class(rule_name)
        end

        def load_class(rule_name)
          rule_class_name = rule_name.split('_').collect(&:capitalize).join
          rule_class = const_get(rule_class_name)
          rule_class.new
        end
      end
    end
  end
end
