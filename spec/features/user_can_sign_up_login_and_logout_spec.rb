require 'rails_helper'

describe 'User' do
  describe 'visits the root directory' do
    it 'can sign up to be a user' do
      welcome_msg = 'Welcome, PearlAngel!'
      username = 'PearlAngel'
      password = 'pdb'

      visit '/'

      click_on 'Sign Up'

      expect(current_path).to eq(new_user_path)

      fill_in :user_username, with: username
      fill_in :user_password, with: password

      click_on 'Create User'

      expect(page).to have_content(welcome_msg)
    end
  end
  describe 'visits the root directory' do
    it 'can login' do
      username = 'PearlAngel'
      password = 'pdb'
      user = User.create!(username: username, password: password)
      visit root_path

      click_on 'Login'

      expect(current_path).to eq(login_path)

      fill_in :username, with: username
      fill_in :password, with: password
      within('#login_form') do
        click_on 'Log in'
      end

      expect(current_path).to eq(user_path(user))
      expect(page).to have_link('Log out')

      click_on 'Log out'
      expect(current_path).to eq(root_path)
    end
  end
  it 'should not allow duplicate usernames' do
    username = 'PearlAngel'
    password = 'pdb'
    user = User.create!(username: username, password: password)

    visit new_user_path

    fill_in :user_username, with: username
    fill_in :user_password, with: password

    click_on 'Create User'

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content('Username already exists')
  end
end
