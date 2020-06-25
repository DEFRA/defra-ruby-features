# frozen_string_literal: true

module DefraRubyFeatures
  class FeatureTogglesController < ::DefraRubyFeatures::ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!

    def index
      if model.respond_to?(:order)
        @feature_toggles = model.order(key: "ASC")
      else
        @feature_toggles = model.order_by(key: "ASC").all
      end
    end

    def create
      model.create!(feature_toggles_params)

      redirect_to feature_toggles_path
    end

    def new
      @feature_toggle = model.new
    end

    private

    def authorize_user!
      authorize! :manage, model
    end

    def model
      DefraRubyFeatures.configuration.feature_toggle_model
    end

    def feature_toggles_params
      params.fetch(:feature_toggles, {}).permit(:key, :active)
    end
  end
end
