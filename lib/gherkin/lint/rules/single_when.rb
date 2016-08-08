module Gherkin::Lint::Rules
  class SingleWhen
    def lint(gherkin_document, path, warnings)
      feature = gherkin_document[:feature]
      dialect = Gherkin::Dialect.for(feature[:language])
      feature[:children].each do |step_container|
        last_step = nil
        step_container[:steps].each do |step|
          if last_step && dialect.when_keywords.index(last_step[:keyword])
            another_when =
              dialect.when_keywords.index(step[:keyword]) ||
              dialect.and_keywords.index(step[:keyword])

            if another_when
              line = step[:location][:line]
              warnings.push << {
                path: path,
                location: {line: line},
                rule: 'single_when',
                description: "A Scenario should have a single When step"
              }
            end
          end
          last_step = step
        end
      end
    end
  end
end
