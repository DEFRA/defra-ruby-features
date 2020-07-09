# frozen_string_literal: true

require_relative "configuration"

module DefraRubyFeatures
  class Engine < ::Rails::Engine
    isolate_namespace DefraRubyFeatures
  end
end
