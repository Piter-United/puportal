require File.expand_path("../boot", __FILE__)

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you"ve limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PublicHtml
  class Application < Rails::Application
    config.time_zone = "Moscow"
    config.i18n.default_locale = :ru
    config.i18n.fallbacks = true
    # config.i18n.load_path += Dir[Rails.root.join("my", "locales", "*.{rb,yml}").to_s]

    config.active_record.raise_in_transactional_callbacks = true

    config.generators do |generator|
      generator.template_engine :slim
      generator.stylesheets false
      generator.javascripts false
      generator.test_framework :rspec, views: false
      generator.fixture_replacement :factory_girl, dir: "spec/factories"
    end

    config.middleware.insert_before 0, "Rack::Cors", debug: true, logger: (-> { Rails.logger }) do
      allow do
        origins "*"

        resource "*",
          headers: :any,
          methods: [:get, :post, :delete, :put, :options, :head],
          max_age: 0
      end
    end

  end
end
