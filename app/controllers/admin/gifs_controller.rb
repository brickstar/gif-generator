require 'GiphyClient'

class Admin::GifsController < Admin::BaseController

  def new
    @gif = Gif.new()
  end

  def create
    @category = Category.find_or_create_by(name: params[:category])
    api_instance = GiphyClient::DefaultApi.new

    api_key = 'jtXwcYzSbItmj65BK3Fp1I5plTdDi5gR' # String | Giphy API Key.

    opts = {
      tag: @category.name
    }

    result = api_instance.gifs_random_get(api_key, opts)
    @gif = @category.gifs.create(image_path: result.data.image_url)
    redirect_to gifs_path
  end
end
