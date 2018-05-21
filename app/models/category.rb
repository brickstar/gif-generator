class Category < ApplicationRecord
  validates :name, presence: true

  has_many :gifs, dependent: :destroy
end
