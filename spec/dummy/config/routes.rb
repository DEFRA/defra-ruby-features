# frozen_string_literal: true

Rails.application.routes.draw do
  mount DefraRubyFeatures::Engine => "/defra-ruby-features"
end
