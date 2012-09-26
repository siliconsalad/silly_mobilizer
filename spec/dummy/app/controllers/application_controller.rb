class ApplicationController < ActionController::Base
  include SiliconMobilizer::MobileRequestsHandler
  protect_from_forgery
end
