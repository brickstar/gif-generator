require 'GiphyClient'

class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new()
  end

  def create
    @category = Category.find_or_create_by(name: params[:category])
    api_instance = GiphyClient::DefaultApi.new

    api_key = ENV['GIPHY_API_KEY']

    opts = {
      tag: @category.name
      rating: 'g'
    }

    result = api_instance.gifs_random_get(api_key, opts)
    @gif = @category.gifs.create(image_path: result.data.image_original_url)

    redirect_to gifs_path
  end
end

# @fixed_height_downsampled_height="200",
# @fixed_height_downsampled_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/200_d.gif",
# @fixed_height_downsampled_width="356",
# @fixed_height_small_height="100",
# @fixed_height_small_still_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/100_s.gif",
# @fixed_height_small_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/100.gif",
# @fixed_height_small_width="178",
# @fixed_width_downsampled_height="112",
# @fixed_width_downsampled_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/200w_d.gif",
# @fixed_width_downsampled_width="200",
# @fixed_width_small_height="56",
# @fixed_width_small_still_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/100w_s.gif",
# @fixed_width_small_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/100w.gif",
# @fixed_width_small_width="100",
# @id="pUywXXqT8g7UQ",
# @image_frames="450",
# @image_height="404",
# @image_mp4_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/giphy.mp4",
# @image_original_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/giphy.gif",
# @image_url="https://media2.giphy.com/media/pUywXXqT8g7UQ/giphy.gif",
# @image_width="720",
# @type="gif",
# @url="https://giphy.com/gifs/star-wars-pUywXXqT8g7UQ"
