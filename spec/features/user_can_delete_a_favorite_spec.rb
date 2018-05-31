require 'rails_helper'

describe 'user' do
  describe 'visits user show page' do
    it 'should be able to delete a favorite' do
      user = User.create!(username: 'mark', password: 'blank', role: 0)
      category = Category.create!(name: 'cats')
      gif = category.gifs.create!(image_path: 'www.example.gif')
      favorite = user.favorites.create(gif_id: gif.id)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit user_path(user)

      expect(user.favorites.count).to eq(1)

      click_on 'Remove From Favorites'

      expect(user.favorites.count).to eq(0)
      expect(current_path).to eq(user_path(user))
    end
  end
end
