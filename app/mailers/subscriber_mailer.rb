class SubscriberMailer < ActionMailer::Base
  default from: "noreply@nittymail.com"

  def opt_in_email(msg)
    begin
      @subscriber = Subscriber.where(email: msg[:email]).first
      @subscription = User.find_by_slug(msg[:subscription])
      @opt_in_token = msg[:opt_in_token]
      print "sending opt-in email sent to #{@subscriber.email} ... "
      settings = (JSON.parse(@subscription.mailer_setting.to_json)).to_hash.symbolize_keys
      ActionMailer::Base.smtp_settings = settings
      mail(:to => @subscriber.email, :subject => "Registered")
      puts "done"
    rescue Exception => e
      puts e.inspect
      raise e
    end
  end

  class Preview < MailView
    # Pull data from existing fixtures
    def opt_in_email
      args = {}
      args[:email] = Subscriber.first.email
      args[:subscription] = User.first.username
      SubscriberMailer.opt_in_email(args)
    end
  end

end
