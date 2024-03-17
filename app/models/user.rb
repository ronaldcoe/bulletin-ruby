class User < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true
    has_many :discussion_threads
    has_many :comments
    has_many :likes
  end
  