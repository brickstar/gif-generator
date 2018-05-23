class GifsController < ApplicationController
  def index
    @category = Category.last
  end
end
