class User < ApplicationRecord
  has_many :votes
  has_many :followings

  has_secure_password
end
