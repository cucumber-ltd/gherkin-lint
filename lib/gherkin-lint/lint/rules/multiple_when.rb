module Gherkin::Lint::Rules
  class MultipleWhen
    def lint(ast, path, warnings)
      dialect = Gherkin3::Dialect.for(ast[:language])
      ast[:scenarioDefinitions].each do |sd|
        last_step = nil
        sd[:steps].each do |step|
          if last_step && dialect.when_keywords.index(last_step[:keyword])
            another_when =
              dialect.when_keywords.index(step[:keyword]) ||
              dialect.and_keywords.index(step[:keyword])

            if another_when
              line = step[:location][:line]
              warnings.push << "Multiple #{last_step[:keyword]}steps.\n#{path}:#{line}"
            end
          end
          last_step = step
        end
      end
    end
  end
end
