class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource)
    manage_path
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
