require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module PhotoApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local

      config.generators do |g|
        g.assets false
        g.helper false
      end
    # Configuration for the application, engines, and railties goes here.
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
  end
end
