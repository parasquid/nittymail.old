class SmtpSetting < MailerSetting
  field :enable_starttls_auto, type: Boolean
  field :address, type: String
  field :port, type: Integer
  field :tls, type: Boolean, default: false
  field :domain, type: String
  field :authentication, type: String
  field :user_name, type: String
  field :password, type: String
end
