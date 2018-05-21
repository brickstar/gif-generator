require 'rails_helper'

describe User, type: :model do
  let(:user) { User.create!(name: 'Pearl', password: 'pdb') }

  describe 'validations' do
    it { should validate_presence_of(:username) }
    it { should validate_presence_of(:password) }
  end

  describe 'relationships' do
    it { should have_many(:favorites) }
    it { should have_many(:gifs).through(:favorites) }
  end
end
