# frozen_string_literal: true

DefraRubyFeatures::Engine.routes.draw do
  resources :feature_toggles, except: %i[show edit], path: "feature-toggles"
end
