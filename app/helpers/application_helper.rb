module ApplicationHelper
  
  def find_named_routes
    routes = []
   
    Rails.application.routes.named_routes.each do |name, route|
      req = route.requirements
      if req[:controller] == params[:controller] && req[:action] == params[:action]
        routes << name
      end
    end

    routes << params[:id] if params.include?(:id)
    routes
  end

end
