# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Declare your gem's dependencies in defra-ruby-features.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use a debugger
# gem 'byebug', group: [:development, :test]

# Use CanCanCan for user roles and permissions
# Version 2.0 doesn't support Mongoid, so we're locked to an earlier one
gem "cancancan", "~> 1.10"

# Use Devise for user authentication
gem "devise", ">= 4.4.3"

# Use sqlite when running tests
gem "sqlite3"

group :test do
  gem "database_cleaner"
  gem "factory_bot_rails", require: false
  gem "rails-controller-testing"
end
