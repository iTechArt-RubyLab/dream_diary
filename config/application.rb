require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module DreamDiary
  class Application < Rails::Application
    config.load_defaults 7.0
    config.active_job.queue_adapter = :sidekiq
    # config.time_zone = "Europe/Minsk"
    config.eager_load_paths << Rails.root.join("#{root}/lib")
  end
end
