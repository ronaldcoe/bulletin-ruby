class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    # You may want to add more validations for email format, password length, etc.
  end
  