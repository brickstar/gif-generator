require 'rails_helper'

describe Gif, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:image_path) }
  end
  describe 'relationships' do
    it { should have_many(:favorites) }
    it { should have_many(:users).through(:favorites) }
    it { should belong_to(:category) }
  end

  describe 'class methods' do

    context '.ordered' do
      it 'should order collection by name' do
        category1 = Category.create!(name: 'aardvarks')
        category4 = Category.create!(name: 'zebras')
        category2 = Category.create!(name: 'bats')
        category3 = Category.create!(name: 'vampires')
        gif1 = category1.gifs.create!(image_path: 'www.example1.gif')
        gif4 = category4.gifs.create!(image_path: 'www.example4.gif')
        gif2 = category2.gifs.create!(image_path: 'www.example2.gif')
        gif3 = category3.gifs.create!(image_path: 'www.example3.gif')

        expect(Gif.ordered).to eq [gif1, gif2, gif3, gif4]
      end
    end
  end
end
