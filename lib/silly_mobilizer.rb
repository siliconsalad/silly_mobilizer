module SillyMobilizer
  require 'yaml'
  require 'action_controller'
  #require 'silly_mobilizer/railtie' if defined?(Rails)
  require 'silly_mobilizer/user_agent_parser'
  require 'silly_mobilizer/mobile_requests_handler'
  require 'silly_mobilizer/fallback_resolver'
  require 'silly_mobilizer/middleware/browser_detection'

  class Engine < Rails::Engine

    initializer "silly_mobilizer.insert_middleware" do |app|
      Mime::Type.register_alias 'text/html', :mobile
      app.config.middleware.use "SillyMobilizer::Middleware::BrowserDetection"
    end

  end
end
