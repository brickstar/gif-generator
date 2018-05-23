require 'rails_helper'

describe 'user visits gifs new page' do
  context 'as admin' do

    it 'allows admin to see new gifs page' do
      admin = User.create(username: 'god', password: 'iamgod', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      expect(page).to have_content('Add a Gif!')
    end
  end

    it 'can see a form to create a new gif' do
      admin = User.create(username: 'god', password: 'iamgod', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      expect(page).to have_content('Add a Gif!')
      expect(page).to have_field('Category')
      expect(page).to have_button('generate gif')
    end

    it 'can create a new gif' do
      admin = User.create(username: 'god', password: 'iamgod', role: 1)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin)

      visit new_admin_gif_path

      fill_in 'Category', with: 'cat'

      click_on 'generate gif'

      expect(current_path).to eq(gifs_path)
      expect(page).to have_content('cat')
      expect(Gif.count).to eq(1)
      expect(Category.count).to eq(1)
    end

  context 'as default user' do
    it 'does not allow default user to see new gifs page' do
      user = User.create(username: 'Pearly', password: 'pdb', role: 0)

      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit new_admin_gif_path

      expect(page).to_not have_content('Add a Gif!')
      expect(page).to have_content("The page you were looking for doesn't exist")
    end
  end
end
