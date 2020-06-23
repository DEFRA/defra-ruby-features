# frozen_string_literal: true

module Defra
  module Ruby
    module Features
      class Engine < ::Rails::Engine
        isolate_namespace Defra::Ruby::Features
      end
    end
  end
end
