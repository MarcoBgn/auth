class User < ApplicationRecord
  attr_accessor :password
  before_validation :encrypt_password

  validates :password, confirmation: true, length: { in: 6..20}
  validates :username, :email, :password_hash, :password_salt, presence: true
  validates :email, uniqueness: true

  private
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
