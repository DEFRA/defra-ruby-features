# frozen_string_literal: true

require "rails_helper"

module DefraRubyFeatures
  RSpec.describe "FeatureToggle", type: :request do
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
      context "when a user is authenticated" do
        before(:each) do
          sign_in(user)
        end

        it "creates a new feature toggle with a given value and redirects to the index page" do
          count = FeatureToggle.count

          post "/feature-toggles", params: { feature_toggle: { key: "test", active: "1" } }

          feature_toggle = FeatureToggle.last

          expect(feature_toggle.key).to eq("test")
          expect(feature_toggle).to be_active
          expect(FeatureToggle.count).to eq(count + 1)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to("/feature-toggles")
        end
      end

      context "when there is no user authenticated" do
        it "redirects away" do
          post "/feature-toggles"

          expect(response).to have_http_status(302)
        end
      end
    end

    context "PUT/PATCH /feature-toggles/:id" do
      let(:feature_toggle) { create(:feature_toggle, active: false) }

      context "when a user is authenticated" do
        before(:each) do
          sign_in(user)
        end

        it "updates a feature toggle with the given params and redirects to the index page" do
          put "/feature-toggles/#{feature_toggle.id}", params: { feature_toggle: { active: "1" } }

          feature_toggle.reload

          expect(feature_toggle).to be_active
          expect(response).to have_http_status(302)
          expect(response).to redirect_to("/feature-toggles")
        end
      end

      context "when there is no user authenticated" do
        it "redirects away" do
          put "/feature-toggles/#{feature_toggle.id}"

          expect(response).to have_http_status(302)
        end
      end
    end

    context "GET /feature-toggles/new" do
      context "when a user is authenticated" do
        before(:each) do
          sign_in(user)
        end

        it "renders a template to create a new feature toggle" do
          get "/feature-toggles/new"

          expect(response).to render_template(:new)
          expect(response).to have_http_status(200)
        end
      end

      context "when there is no user authenticated" do
        it "redirects away" do
          get "/feature-toggles/new"

          expect(response).to have_http_status(302)
        end
      end
    end

    context "DELETE /feature-toggles/:id" do
      let!(:feature_toggle) { create(:feature_toggle) }

      context "when there is a user authenticated" do
        before(:each) do
          sign_in(user)
        end

        it "deletes a feature toggle and redirects to the index page" do
          count = FeatureToggle.count

          delete "/feature-toggles/#{feature_toggle.id}"

          expect(FeatureToggle.count).to eq(count - 1)
          expect(response).to have_http_status(302)
          expect(response).to redirect_to("/feature-toggles")
        end
      end

      context "when there is no user authenticated" do
        it "redirects away" do
          delete "/feature-toggles/#{feature_toggle.id}"

          expect(response).to have_http_status(302)
        end
      end
    end
  end
end
