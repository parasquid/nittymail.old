class UsersController < ApplicationController
  before_filter :load_subscription
  
  def show
  end
  
  private
  
  def load_subscription
    @subscription = User.find_by_slug(params[:id]) || not_found
  end
  
end
