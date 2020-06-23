# frozen_string_literal: true

module Defra
  module Ruby
    module Features
      class ApplicationController < ActionController::Base
        protect_from_forgery with: :exception
      end
    end
  end
end
