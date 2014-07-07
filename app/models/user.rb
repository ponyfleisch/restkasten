class User < ActiveRecord::Base
  has_secure_password

  has_many :entries
  has_many :purchases
end
