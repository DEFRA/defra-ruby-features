# frozen_string_literal: true

module DefraRubyFeatures
  class FeatureTogglesController < ::DefraRubyFeatures::ApplicationController
    before_action :authenticate_user!
    before_action :authorize_user!

    def index
      # MongoId
      @feature_toggles = model.order(key: "ASC") if model.respond_to?(:order)

      # ActiveRecord
      @feature_toggles = model.order_by(key: "ASC").all if model.respond_to?(:order_by)
    end

    def create
      model.create!(feature_toggle_params)

      redirect_to feature_toggles_path
    end

    def update
      @feature_toggle = model.find_by(id: params[:id])

      @feature_toggle.update!(feature_toggle_params)

      redirect_to feature_toggles_path
    end

    def new
      @feature_toggle = model.new
    end

    def destroy
      @feature_toggle = model.find_by(id: params[:id])

      @feature_toggle.destroy!

      redirect_to feature_toggles_path
    end

    private

    def authorize_user!
      authorize! :manage, model
    end

    def model
      @_model ||= DefraRubyFeatures.configuration.feature_toggle_model_name.constantize
    end

    def feature_toggle_params
      params.fetch(:feature_toggle, {}).permit(:key, :active)
    end
  end
end
