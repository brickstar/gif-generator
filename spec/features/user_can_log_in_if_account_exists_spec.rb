require 'rails_helper'

describe 'User' do
  describe 'visits the root directory' do
    it 'can login if account already exists' do
      user = User.create!(username: 'PearlAngel', password: 'pdb')

      visit '/'

      click_on 'I already have an account'

      expect(current_path).to eq(login_path)

      fill_in 'username', with: user.username
      fill_in 'password', with: user.password

      click_on 'Log In'

      expect(current_path).to eq(user_path(user))
      expect(page).to have_content("Welcome, #{user.username}")
    end
  end
end
