# frozen_string_literal: true

require "rails_helper"

module DefraRubyFeatures
  RSpec.describe Configuration do
    subject(:defra_ruby_features) { described_class.new }

    it "sets the appropriate default config settings" do
      expect(defra_ruby_features.feature_toggle_model_name).to be_nil
    end
  end
end
