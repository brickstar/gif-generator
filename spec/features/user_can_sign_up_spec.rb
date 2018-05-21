require 'rails_helper'

describe 'User' do
  describe 'visits the root directory' do
    it 'can sign up to be a user' do
      visit '/'

      click_on 'Sign Up!'

      expect(current_path).to eq(new_user_path)

      fill_in 'user[username]', with: 'PearlAngel'
      fill_in 'user[password]', with: 'pdb'

      click_on 'Create User'

      expect(page).to have_content('Welcome, PearlAngel!')
    end
  end
end
