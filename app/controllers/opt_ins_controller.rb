class OptInsController < ApplicationController
  def confirm
    opt_in = OptIn.where(token: params[:opt_in_token], used: false).first || not_found
    raise opt_in.inspect
    @subscriber = Subscriber.where(email: opt_in.subscriber).first
    @subscription = User.find_by_slug(opt_in.subscription)
    # add the subscriber to the mailing list
    @subscriber.subscriptions << @subscription
    @subscriber.save!
    opt_in.used = true
    opt_in.save!
  end
end
