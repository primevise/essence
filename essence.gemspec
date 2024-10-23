require_relative "lib/essence/version"

Gem::Specification.new do |spec|
  spec.name        = "essence"
  spec.version     = Essence::VERSION
  spec.license     = "MIT"
  spec.authors     = ["Elvinas Predkelis", "Primevise"]
  spec.email       = ["info@primevise.com"]
  spec.homepage    = "https://rubygems.org/gems/essence"
  spec.summary     = "Component library for Ruby applications using Phlex"
  spec.description = "Component library for Ruby applications using Phlex"
 	spec.required_ruby_version = ">= 3.3.1"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/primevise/essence"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{components,lib}/**/*", "LICENCE", "Rakefile", "README.md"]
  end

  spec.add_dependency "phlex", ">= 2.0.0.beta2"
end
