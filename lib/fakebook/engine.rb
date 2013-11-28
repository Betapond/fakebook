module Fakebook
  class Engine < ::Rails::Engine
    engine_name "fakebook"
    isolate_namespace Fakebook

    initializer "fakebook.configure_rails_initialization" do |app|
      app.middleware.use Fakebook::DataInjectorMiddleware
    end

    config.generators do |g|
      g.test_framework :rspec
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
