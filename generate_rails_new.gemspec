# frozen_string_literal: true

require_relative "lib/generate_rails_new/version"

Gem::Specification.new do |spec|
  spec.name          = "generate_rails_new"
  spec.version       = GenerateRailsNew::VERSION
  spec.authors       = ["Arthur Hess"]
  spec.email         = ["contact@arthurhess.com"]
  spec.summary       = "CLI tool that helps create a new Rails application with interactive options."
  spec.description   = "This gem provides a CLI tool that helps create a new Rails application with interactive options."
  spec.homepage      = "https://github.com/arthurhess/generate_rails_new"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split("\n")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 1.2"
end

