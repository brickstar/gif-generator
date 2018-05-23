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
end
