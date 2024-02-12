class User < ApplicationRecord
  has_secure_password
  validate :email, presence: true, uniqueness: true
  has_many :posts
end
