class User < ApplicationRecord
  attr_accessor :password
  validates :password, confirmation: true, length: { in: 6..20}
  validates :username, :email, :password, presence: true
  validates :email, uniqueness: true
end
