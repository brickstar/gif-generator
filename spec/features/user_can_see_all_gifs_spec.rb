require 'rails_helper'

describe 'User' do
  describe 'visits /gifs/index' do
    it 'can see all the gifs' do
      category1 = Category.create(name: 'cats')
      category2 = Category.create(name: 'frogs')
      category3 = Category.create(name: 'dogs')
      category4 = Category.create(name: 'bats')
      gif1 = category1.gifs.create!(image_path: 'https://media2.giphy.com/media/Ov5NiLVXT8JEc/200w.webp')
      gif2 = category2.gifs.create!(image_path: 'https://media2.giphy.com/media/frPr29OhZ6ncY/200w.webp')
      gif3 = category3.gifs.create!(image_path: 'https://media3.giphy.com/media/muVfdK4fmamek/200w.webp')
      gif4 = category4.gifs.create!(image_path: 'https://media1.giphy.com/media/ow8luev3sOjO8/200w.webp')

      visit gifs_path
save_and_open_page
      expect(page).to have_content(gif1)
      expect(page).to have_xpath("//img[@src='https://media2.giphy.com/media/Ov5NiLVXT8JEc/200w.webp']")
    end
  end
end
