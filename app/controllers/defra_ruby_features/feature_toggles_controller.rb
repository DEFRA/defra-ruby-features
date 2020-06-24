# frozen_string_literal: true

module DefraRubyFeatures
  class FeatureTogglesController < ::DefraRubyFeatures::ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!

    def index
      @feature_toggles = FeatureToggle.order(:key).all
    end

    def create
      @feature_toggles.create!(feature_toggles_params)
    end

    def new
    end

    private

    def authorize_user!
      authorize! :manage, FeatureToggle
    end
  end
end
