class Favorite < ApplicationRecord
  belongs_to :gif
  belongs_to :user

  def self.for_gif(gif_id)
    find_by(gif_id: gif_id)
  end
end
