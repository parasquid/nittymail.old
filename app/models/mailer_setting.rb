class MailerSetting
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :user

  field :delivery_method, type: Symbol, default: :sendmail
end
