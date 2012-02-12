class OptIn
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subscription, type: String
  validate_presence_of :suscription

  field :subscriber, type: String
  validate_presence_of :subscriber

  field :token, type: String
  validate_presence_of :token

  field :used, type: Boolean, default: false
  validate_presence_of :used?

  def self.generate_token(subscription, subscriber)
    token = rand(36**64).to_s(36)
    OptIn.create!(subscription: subscription, subscriber: subscriber, token: token)
    token
  end
end
