# frozen_string_literal: true

require "defra_ruby_features"

DefraRubyFeatures.configure do |config|
  config.feature_toggle_model = FeatureToggle
end
