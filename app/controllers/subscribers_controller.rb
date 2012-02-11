class SubscribersController < ApplicationController
  before_filter :load_subscription

  def create
    @subscriber = Subscriber.find_or_create_by(params[:subscriber])

    # TODO: check if subscriber is already subscribed
    @subscriber.subscriptions << @subscription
    @subscriber.save!
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def load_subscription
    @subscription = User.find_by_slug(params[:subscription])
  end
end
