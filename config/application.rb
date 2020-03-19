require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EspTestSidekiq
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.active_job.queue_adapter = :sidekiq

    config.redis_sidekiq_options = { url: 'redis://127.0.0.1:6379/1' }
    Sidekiq.configure_server do |sidekiq_config|
      sidekiq_config.redis = config.redis_sidekiq_options
    end

    Sidekiq.configure_client do |sidekiq_config|
      sidekiq_config.redis = config.redis_sidekiq_options
    end


    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
