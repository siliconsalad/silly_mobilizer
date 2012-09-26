module SiliconMobilizer
  require 'yaml'
  require 'action_controller'
  #require 'silicon_mobilizer/railtie' if defined?(Rails)
  require 'silicon_mobilizer/user_agent_parser'
  require 'silicon_mobilizer/mobile_requests_handler'
  require 'silicon_mobilizer/fallback_resolver'
  require 'silicon_mobilizer/middleware/browser_detection'

  class Engine < Rails::Engine

    initializer "silicon_mobilizer.insert_middleware" do |app|
      Mime::Type.register_alias 'text/html', :mobile
      app.config.middleware.use "SiliconMobilizer::Middleware::BrowserDetection"
    end

  end
end
