# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'gherkin/lint/version'

Gem::Specification.new do |spec|
  spec.name          = "gherkin-lint"
  spec.version       = Gherkin::Lint::VERSION
  spec.authors       = ["Aslak Hellesøy"]
  spec.email         = ["aslak.hellesoy@gmail.com"]

  spec.summary       = %q{Find problems in Gherkin}
  spec.homepage      = "https://docs.cucumber.io/gherkin-lint"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "gherkin", "~> 4.0"

  spec.add_development_dependency "rspec", "~> 3.5"
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 11.2"
  spec.add_development_dependency "cucumber", "~> 2.4"
  spec.add_development_dependency "aruba", "~> 0.14"
end
