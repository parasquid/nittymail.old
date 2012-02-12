class OptInsController < ApplicationController
  def edit
    opt_in = OptIn.where(token: params[:opt_in_token], used: false) || not_found
    @subscriber = Subscriber.where(email: opt_in.subscriber)
    @subscription = User.find_by_slug(opt_in.subscription)
    # add the subscriber to the mailing list
    @subscriber.subscriptions << @subscription
    @subscriber.save!
    opt_in.used = true
    opt_in.save!
  end
end
