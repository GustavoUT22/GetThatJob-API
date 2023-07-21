require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Getthatjobrails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins 'http://localhost:5173' # Reemplaza con la URL correcta de tu cliente
        resource "/login/professionals", headers: :any, methods: [:get, :post, :options]
        resource "/profile/professionals", headers: :any, methods: [:get, :post, :patch, :options]
        resource "/profile/recruiters", headers: :any, methods: [:get, :post, :patch, :options]
        resource "/login/recruiters", headers: :any, methods: [:get, :post, :options]
        resource "/logout/professionals", headers: :any, methods: [:delete]
        resource "/jobs", headers: :any, methods: [:get, :post]
        resource "/jobs/:id", headers: :any, methods: [:get, :options]
        resource "/application", headers: :any, methods: [:post, :options]
        resource "/applications", headers: :any, methods: [:get, :options]
        resource "/signup/professionals", headers: :any, methods: [:get, :post, :patch, :options]
      end
    end
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
