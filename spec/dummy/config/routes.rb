# frozen_string_literal: true

Rails.application.routes.draw do
  mount Defra::Ruby::Features::Engine => "/defra-ruby-features"
end
