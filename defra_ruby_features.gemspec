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
  s.required_ruby_version = ">= 3.1"
  s.metadata["rubygems_mfa_required"] = "true"

  s.files = Dir["{app,config,db,lib}/**/*", "LICENSE", "Rakefile", "README.md"]

  # let the apps determine the rails version
  s.add_dependency "rails"
  s.add_dependency "sprockets-rails"

  # Use CanCanCan for user roles and permissions
  # waste-carriers (WCR) has CanCanCan locked to v1.10. It uses MongoDb and
  # Mongoid and CanCanCan dropped support for Mongoid in v2.
  # WEX uses PostgreSQL and uses CanCanCan v2.3. So we know our minimum but we
  # can't lock to a specific because we have to deal with both services.
  s.add_dependency  "cancancan", ">= 1.10"

  # Use Devise for user authentication
  s.add_dependency  "devise", ">= 4.9"
end
