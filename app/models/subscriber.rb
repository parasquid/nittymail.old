class Subscriber
  include Mongoid::Document
  include Mongoid::Timestamps

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  # :database_authenticatable, :registerable,
  #       :recoverable, :rememberable, :trackable, :validatable

  devise :token_authenticatable, authentication_keys: [:authentication_token]

  ## Token authenticatable
  field :authentication_token, :type => String

  field :email, type: String
  validates_presence_of :email

  attr_accessible :email

  has_and_belongs_to_many :subscriptions, class_name: 'User'
end
