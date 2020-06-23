# frozen_string_literal: true

begin
  require "bundler/setup"
rescue LoadError
  puts "You must `gem install bundler` and `bundle install` to run rake tasks"
end

require "rdoc/task"

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = "rdoc"
  rdoc.title    = "DefraRubyFeatures"
  rdoc.options << "--line-numbers"
  rdoc.rdoc_files.include("README.md")
  rdoc.rdoc_files.include("lib/**/*.rb")
end

load "rails/tasks/statistics.rake"

Bundler::GemHelper.install_tasks

Dir[File.join(File.dirname(__FILE__), "lib/tasks/**/*.rake")].each { |f| load f }

require "bundler/gem_tasks"

require "rake/testtask"

# This is wrapped to prevent an error when rake is called in environments where
# rspec may not be available, e.g. production. As such we don't need to handle
# the error.
begin
  require "rspec/core/rake_task"

  RSpec::Core::RakeTask.new(:spec)

  task default: :spec
rescue LoadError
  # no rspec available
end
