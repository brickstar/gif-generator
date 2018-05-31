require 'rails_helper'

describe Category, type: :model do

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'relationships' do
    it { should have_many(:gifs) }
  end

  describe 'class methods' do

    context '.ordered' do
      it 'should order collection by name' do
        category1 = Category.create!(name: 'aardvarks')
        category4 = Category.create!(name: 'zebras')
        category2 = Category.create!(name: 'bats')
        category3 = Category.create!(name: 'vampires')

        expect(Category.ordered).to eq [category1, category2, category3, category4]
      end
    end


  end
end
