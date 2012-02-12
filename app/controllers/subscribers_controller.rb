class SubscribersController < ApplicationController
  before_filter :load_subscription

  def create
    @subscriber = Subscriber.find_or_create_by(params[:subscriber])

    unless @subscriber.subscriptions.include? @subscription
      @opt_in_token = OptIn.generate_token @subscription.username, @subscriber.email
    else
      redirect_to already_subscribed_path and return
    end

    msg = {email: @subscriber.email, subscription: @subscription.username, opt_in_token: @opt_in_token}
    SUBSCRIBER_QUEUE.push(msg)
    #SubscriberMailer.opt_in_email(msg).deliver

    flash[:email] = @subscriber.email
    redirect_to thank_you_for_subscribing_path
  end

  def edit
    @subscriber = Subscriber.where(authentication_token: params[:authentication_token]).first || not_found
  end

  def update
  end

  def destroy
  end

  def thankyou
    @email = session[:email]
  end

  def already_subscribed

  end

  private

  def load_subscription
    @subscription = User.find_by_slug(params[:subscription])
  end

end
