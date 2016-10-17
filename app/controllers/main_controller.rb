class MainController < ApplicationController

  def index
    @movies = Movie.all
    @books = Book.all
    @albums = Album.all
  end


  # #########
  private

  def media_listing_params
    # params.require(:media_listing).permit(:type, :ranking, :name, :creator, :description)
    params.permit(:type, :ranking, :name, :creator, :description)
  end

end
