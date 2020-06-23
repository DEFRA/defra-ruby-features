# frozen_string_literal: true

module DefraRubyFeatures
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true
  end
end
