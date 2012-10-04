module SillyMobilizer
  module MobileRequestsHandler
    extend ActiveSupport::Concern

    included do
      append_view_path ::SillyMobilizer::FallbackResolver.new("app/views", { mobile: [:json, :html] })
      before_filter :handle_mobile
      helper_method :current_device_type
      respond_to    :json, :html, :mobile
    end

  private

    def current_device_type
      env['BROWSER_TYPE']
    end

    def handle_mobile
      return if session[:device_type_override] == :desktop
      if mobile_request?
        request.format = :mobile
      end
    end

    def mobile_request?
      env['BROWSER_TYPE'] == :mobile
    end

  end
end
