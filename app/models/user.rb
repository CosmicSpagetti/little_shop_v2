class User < ApplicationRecord
  before_save { self.email = email.downcase }

  validates_presence_of :email,
                        :active,
                        :name,
                        :address,
                        :city,
                        :state,
                        :zip,
                        :role
  has_many :orders
  has_many :items

  enum role: ['user', 'merchant', 'admin']

  validates :email, uniqueness: true, presence: true
  validates_presence_of :password, require: true

  has_secure_password
end