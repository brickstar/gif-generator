require 'rails_helper'

context 'user' do
  let!(:user) { User.create(username: 'pearl', password: 'blank', role: 0) }

  context 'visits show page' do
    let!(:category) { Category.create(name: 'cats') }
    let!(:gif) { category.gifs.create(image_path: 'www.example.gif') }

    it 'should see all their favorites' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      favorite = user.favorites.create(gif_id: gif.id, user_id: user.id)

      visit user_path(user)

      expect(page).to have_content('cats')
      expect(page).to have_css("img[src*='#{gif.image_path}']")
    end
  end
end
