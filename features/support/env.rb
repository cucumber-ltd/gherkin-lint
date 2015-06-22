require 'rspec'
require 'aruba'
require 'aruba/cucumber'
require 'aruba/in_process'
require 'gherkin/lint/main'

Aruba::InProcess.main_class = Gherkin::Lint::Main
Aruba.process = Aruba::InProcess
