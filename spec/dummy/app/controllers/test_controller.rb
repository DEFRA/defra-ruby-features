# frozen_string_literal: true

class TestController < ApplicationController
  def index
    current_user
  end
end
