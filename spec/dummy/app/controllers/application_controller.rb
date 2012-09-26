class ApplicationController < ActionController::Base
  include SillyMobilizer::MobileRequestsHandler
  protect_from_forgery
end
