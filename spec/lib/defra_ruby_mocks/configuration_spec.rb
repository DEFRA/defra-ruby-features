# frozen_string_literal: true

require "rails_helper"

module DefraRubyFeatures
  RSpec.describe Configuration do
    let(:subject) { described_class.new }

    it "sets the appropriate default config settings" do
      expect(subject.feature_toggle_model_name).to be_nil
    end
  end
end
