# frozen_string_literal: true

require "rails_helper"

module DefraRubyFeatures
  RSpec.describe "FeatureToggles", type: :request do
    let(:user) { create(:user) }
    before(:each) do
      sign_in(user)
    end

    context "GET /feature-toggles" do
      it "returns a list of available feature toggles" do
        expect(true).to be_truthy
      end
    end

    context "POST /feature-toggles" do
      pending "it creates a new feature toggle with a given value"
    end

    context "GET /feature-toggles/new" do
      pending "it renders a template to create a new feature toggle"
    end

    context "DELETE /feature-toggles/:id" do
      pending "it deletes a feature toggle"
    end
  end
end
