# frozen_string_literal: true

require_relative "boot"

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"
require "sprockets/railtie"
require "devise"
require "cancancan"

Bundler.require(*Rails.groups)
require "defra_ruby_features"

module Dummy
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    config.autoloader = :classic

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # For Rails 7: https://guides.rubyonrails.org/active_record_multiple_databases.html#migrate-to-the-new-connection-handling
    config.active_record.legacy_connection_handling = false
  end
end
