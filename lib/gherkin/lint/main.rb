require 'json'
require_relative 'api'
require_relative 'rules'

module Gherkin
  module Lint
    class Main
      def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
        @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
      end

      def execute!
        api = Api.new
        warnings = []

        path = @argv[0]
        feature = api.feature_at(path).with(IO.read(path))

        Rules.each do |rule|
          feature.lint(rule, warnings)
        end

        @stdout.puts JSON.pretty_generate(warnings)

        exitstatus = warnings.any? ? 1 : 0
        @kernel.exit(exitstatus)
      end
    end
  end
end
