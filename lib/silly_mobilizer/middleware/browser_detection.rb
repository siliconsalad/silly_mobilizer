module SillyMobilizer
  module Middleware
    class BrowserDetection

      def initialize(app)
        @app = app
      end

      def call(env)
        parser = SillyMobilizer::UserAgentParser.new(env['HTTP_USER_AGENT'])
        env['BROWSER_TYPE'] = parser.type
        @app.call(env)
      end

    end
  end
end
