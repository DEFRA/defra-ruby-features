# frozen_string_literal: true

require_relative "configuration"

module DefraRubyFeatures
  class Engine < ::Rails::Engine
    isolate_namespace DefraRubyFeatures

    config.generators do |g|
      g.test_framework :rspec
    end
  end
end
