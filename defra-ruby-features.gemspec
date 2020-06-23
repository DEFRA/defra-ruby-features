$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "defra/ruby/features/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "defra-ruby-features"
  spec.version     = Defra::Ruby::Features::VERSION
  spec.authors     = ["Defra"]
  spec.email       = ["alan.cruikshanks@environment-agency.gov.uk"]
  spec.homepage    = "https://github.com/DEFRA/defra-ruby-features"
  spec.summary     = "Defra Ruby on Rails features manager engine"
  spec.description = "A Rails engine which can be used to activate and deactivate feature toggles when loaded into an application"
  spec.license     = "The Open Government Licence (OGL) Version 3"

  spec.test_files = Dir["spec/**/*"]
  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.3", ">= 6.0.3.2"

  # Allows us to automatically generate the change log from the tags, issues,
  # labels and pull requests on GitHub. Added as a dependency so all dev's have
  # access to it to generate a log, and so they are using the same version.
  # New dev's should first create GitHub personal app token and add it to their
  # ~/.bash_profile (or equivalent)
  # https://github.com/skywinder/github-changelog-generator#github-token
  spec.add_development_dependency "defra_ruby_style"
  spec.add_development_dependency "github_changelog_generator"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "simplecov"
end
