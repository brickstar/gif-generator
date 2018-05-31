class Category < ApplicationRecord
  validates :name, presence: true

  has_many :gifs, dependent: :destroy

  def self.ordered
    order(:name)
  end
end
