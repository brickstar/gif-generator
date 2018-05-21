class User < ApplicationRecord
  validates :username, presence: true
  validates :password, presence: true

  has_many :favorites
  has_many :gifs, through: :favorites

  has_secure_password
end
