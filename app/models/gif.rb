class Gif < ApplicationRecord
  validates :image_path, presence: true

  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites, dependent: :destroy
  belongs_to :category

  def self.ordered
    joins(:category)
    .order('categories.name')
  end
end
