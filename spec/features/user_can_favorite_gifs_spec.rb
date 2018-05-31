require 'rails_helper'

describe 'User' do
  let(:user) { User.create(username: 'pearl', password: 'blank', role: 0) }
  # block won't execute until user is called - way around this is to use let!
  describe 'visits gifs index page' do
    let!(:category) { Category.create(name: 'cats')}
    let!(:gif) { category.gifs.create(image_path: 'www.example.gif',) }
    # scoping this variable to this describe block - only avail in this describe block
    # describe and context creates the hierarchy, cannot use let inside it block

    it 'can add a favorite gif' do
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit gifs_path

      expect(page).to have_button('Add to Favorites')
      # within(".#{gif.id}") do
      click_on 'Add to Favorites'
      # end

      expect(current_path).to eq(gifs_path)

      expect(user.favorites.count).to eq(1)

      expect(page).to have_link('Go to My Gifs')
    end
  end
end
