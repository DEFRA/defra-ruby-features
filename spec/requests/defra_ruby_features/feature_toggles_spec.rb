# frozen_string_literal: true

require "rails_helper"

module DefraRubyFeatures
  RSpec.describe "FeatureToggles", type: :request do
    let(:user) { create(:user) }

    context "GET /feature-toggles" do
      context "when a user is authenticated" do
        before(:each) do
          sign_in(user)
        end

        it "returns a list of available feature toggles" do
          key = "a_feature_toggle"
          create(:feature_toggle, key: key)

          get "/feature-toggles"

          expect(response.body).to include(key)
          expect(response).to have_http_status(200)
          expect(response).to render_template(:index)
        end
      end

      context "when there is no user authenticated" do
        it "redirects away" do
          get "/feature-toggles"

          expect(response).to have_http_status(302)
        end
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
