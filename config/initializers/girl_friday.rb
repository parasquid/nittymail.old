SUBSCRIBER_QUEUE = GirlFriday::WorkQueue.new(:subscriber_opt_in, :size => 5) do |msg|
  SubscriberMailer.opt_in_email(msg).deliver
end
