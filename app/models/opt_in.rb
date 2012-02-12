class OptIn
  include Mongoid::Document
  include Mongoid::Timestamps

  field :subscription, type: String
  validates_presence_of :subscription

  field :subscriber, type: String
  validates_presence_of :subscriber

  field :token, type: String
  validates_presence_of :token

  field :used, type: Boolean, default: false
  validates_presence_of :used?

  def self.generate_token(subscription, subscriber)
    token = rand(36**64).to_s(36)
    OptIn.create!(subscription: subscription, subscriber: subscriber, token: token)
    token
  end
end
