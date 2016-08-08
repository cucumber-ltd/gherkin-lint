module Gherkin::Lint::Rules
  class NoUi
    UI_TERMS = {
      'en' => ['click ', 'redirect']
    }

    def lint(gherkin_document, path, warnings)
      feature = gherkin_document[:feature]
      language = feature[:language]
      ui_terms = UI_TERMS[language]

      feature[:children].each do |step_container|
        step_container[:steps].each do |step|
          ui_terms.each do |ui_term|
            index = step[:text].index(ui_term)
            if(index)
              column = step[:location][:column] + step[:keyword].length + index
              line = step[:location][:line]

              warnings.push << {
                path: path,
                location: {line: line, column: column},
                rule: 'no_ui',
                description: "Avoid UI speak in steps"
              }
            end
          end
        end
      end
    end
  end
end
