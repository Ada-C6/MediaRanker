class HomeController < ApplicationController

  def index
    @books = Book.all.order(:ranking).reverse
    @movies = Movie.all.order(:ranking).reverse
    @albums = Album.all.order(:ranking).reverse
  end

end
