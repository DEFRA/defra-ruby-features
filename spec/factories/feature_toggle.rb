# frozen_string_literal: true

FactoryBot.define do
  factory :feature_toggles do
    key { "test-feature" }
    active  { false }
  end
end
