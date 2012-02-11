class SubscribersController < ApplicationController
  before_filter :load_subscription

  def create
    @subscriber = Subscriber.find_or_create_by(params[:subscriber])

    # TODO: check if subscriber is already subscribed
    @subscriber.subscriptions << @subscription
    @subscriber.save!

    SUBSCRIBER_QUEUE.push(email: @subscriber.email, subscription: @subscription.username)

    flash[:email] = @subscriber.email
    redirect_to thank_you_for_subscribing_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def thankyou
    @email = flash[:email]
  end

  private

  def load_subscription
    @subscription = User.find_by_slug(params[:subscription])
  end
end
