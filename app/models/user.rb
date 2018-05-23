class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true

  has_many :favorites, dependent: :destroy
  has_many :gifs, through: :favorites

  has_secure_password

  enum role: [:default, :admin]
end
