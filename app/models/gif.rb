class Gif < ApplicationRecord
  validates :image_path, presence: true

  has_many :favorites
  has_many :users, through: :favorites
  belongs_to :category
end
