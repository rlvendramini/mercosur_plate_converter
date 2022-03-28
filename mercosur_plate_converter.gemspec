# frozen_string_literal: true

require_relative "lib/mercosur_plate_converter/version"

Gem::Specification.new do |spec|
  spec.name = "mercosur_plate_converter"
  spec.version = MercosurPlateConverter::VERSION
  spec.authors = ["Renan Luiz Vendramini"]
  spec.email = ["renanlvendramini@gmail.com"]

  spec.summary = "An easy converter of Mercosur plates to Brazilian plates."
  spec.description = "I created this gem to convert Mercosur plates to Brazilian plates and vice versa."
  spec.homepage = "https://github.com/rlvendramini/mercosur_plate_converter"
  spec.required_ruby_version = ">= 2.6.0"
  spec.license = "MIT"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "#{spec.homepage}/blob/master/mercosur_plate_converter.gemspec"
  spec.metadata["changelog_uri"] = "#{spec.homepage}/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.2"
  spec.add_development_dependency "rubocop-rake", "~> 0.6.0"
  spec.add_development_dependency "rubocop-rspec", "~> 2.9.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
end
