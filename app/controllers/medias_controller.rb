class MediasController < ApplicationController
  def index
    @movies = Movie.all.order(:ranking).reverse.first(10)
    @books = Book.all.order(:ranking).reverse.first(10)
    @albums = Album.all.order(:ranking).reverse.first(10)
  end
end
