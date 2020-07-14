# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "defra_ruby_features/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "defra_ruby_features"
  s.version     = DefraRubyFeatures::VERSION
  s.authors     = ["Defra"]
  s.email       = ["alan.cruikshanks@environment-agency.gov.uk"]
  s.homepage    = "https://github.com/DEFRA/defra-ruby-features"
  s.summary     = "Defra Ruby on Rails features manager engine"
  s.description = "A Rails engine which can be used to activate and deactivate feature toggles"
  s.license     = "The Open Government Licence (OGL) Version 3"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]
  s.test_files = Dir["spec/**/*"]

  s.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  # Use CanCanCan for user roles and permissions
  # Version 2.0 doesn't support Mongoid, so we're locked to an earlier one
  s.add_dependency  "cancancan", "~> 1.10"

  # Use Devise for user authentication
  s.add_dependency  "devise", ">= 4.4.3"

  # Allows us to automatically generate the change log from the tags, issues,
  # labels and pull requests on GitHub. Added as a dependency so all dev's have
  # access to it to generate a log, and so they are using the same version.
  # New dev's should first create GitHub personal app token and add it to their
  # ~/.bash_profile (or equivalent)
  # https://github.com/skywinder/github-changelog-generator#github-token
  s.add_development_dependency "github_changelog_generator"

  s.add_development_dependency "database_cleaner"
  s.add_development_dependency "defra_ruby_style"
  s.add_development_dependency "factory_bot_rails"
  s.add_development_dependency "pry-byebug"
  s.add_development_dependency "rails-controller-testing"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "simplecov", "~> 0.17.1"
  s.add_development_dependency "sqlite3"
end
