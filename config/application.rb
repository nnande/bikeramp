require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bikeramp
  class Application < Rails::Application
    REDUNDANT_MIDDLEWARES = [
      Rack::Sendfile,
      ActionDispatch::Static,
      ActionDispatch::RequestId,
      ActionDispatch::RemoteIp,
      ActionDispatch::DebugExceptions,
      Rack::Head,
    ].freeze

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # We do not need these middlewares in the application
    REDUNDANT_MIDDLEWARES.each { |klass| config.middleware.delete klass }
	
    %w[queries presenters schemas].each do |dir|
      config.autoload_paths << Rails.root.join('app', dir)
    end
  end
end
