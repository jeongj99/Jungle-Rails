class User < ApplicationRecord
  has_secure_password

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = self.find_by("Lower(email)= ?", email.strip.downcase)

    if user && user.authenticate(password)
      user
    end
  end
end
