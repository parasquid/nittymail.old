class SubscriberMailer < ActionMailer::Base
  default from: "noreply@nittymail.com"

  def opt_in_email(msg)
    begin
      @subscriber = Subscriber.where(email: msg[:email]).first
      @subscription = User.find_by_slug(msg[:subscription])
      print "sending opt-in email sent to #{@subscriber.email} ... "
      mail(:to => @subscriber.email, :subject => "Registered", :from => "noreply@nittymail.com")
      puts "success"
    rescue Exception => e
      puts e.inspect
    end
  end
end
