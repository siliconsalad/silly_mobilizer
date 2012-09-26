module SillyMobilizer
  module MobileRequestsHandler
    extend ActiveSupport::Concern

    included do
      before_filter :handle_mobile

      append_view_path ::SillyMobilizer::FallbackResolver.new("app/views", mobile: :html)

      respond_to :html, :mobile
    end

  private

    def handle_mobile
      return if session[:device_type_override] == :desktop || request.xhr?
      if mobile_request?
        request.format = :mobile
      end
    end

    def mobile_request?
      env['BROWSER_TYPE'] == :mobile
    end

  end
end
