class ManageController < ApplicationController
  before_filter :authenticate_user!

  def index
    @subscribers = current_user.subscribers
  end
end
